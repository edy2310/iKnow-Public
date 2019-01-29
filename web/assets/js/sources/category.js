import Vue from 'vue/dist/vue'; //Development
//import Vue from 'vue/dist/vue.min'; //Production
import axios from 'axios';
import qs from 'qs';

var categoryIntern = new Vue({
    el: "#categoryIntern",
    data:{
        CategoryName: null,
        CategoryIcon: null,
        Questions: [],
        loading: true,
        found: false,
        showTable: false
    }, 
    mounted(){
        let path = window.location.search.substr(1);
        path = path.split("=");
        this.CategoryName = path[1]; 
        this.fetchData();
    },
    methods:{
        fetchData: async function(){
            let reqData = {
               category: this.CategoryName
            }
            let data = qs.stringify(reqData);
            let answer = await axios.post('../getQuestions', data, {
                headers: {
                   'Content-Type': 'application/x-www-form-urlencoded'
                }
            });
            let dataRec = answer.data;
            if (this.isEmpty(dataRec)) {
                this.loading = false;
                this.found = true;
                this.CategoryName = "Not found";
                this.CategoryIcon = "far fa-sad-cry";
            }
            else{
                for(let key in dataRec){
                    this.Questions.push(dataRec[key]);
                }
                this.CategoryIcon = this.Questions[0].iconCode;
                this.loading = false;
                this.showTable = true; 
                
            }
            
        },
        isEmpty: function(obj){
            for(var key in obj) {
                if(obj.hasOwnProperty(key))
                    return false;
            }
            return true;
        }
    }
})  