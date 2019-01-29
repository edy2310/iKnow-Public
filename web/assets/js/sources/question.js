import Vue from 'vue/dist/vue';
//import Vue from 'vue/dist/vue.min'; //Production
import axios from 'axios';
import qs from 'qs';

var questionIntern = new Vue({
    el: "#questionIntern",
    data: {
        title: null,
        QuestionProp: [],
        QuestionTitle: null,
        CategoryName: null,
        CategoryIcon: null,
        QuestionContent: null,
        loading: true,
        found: false
    },
    mounted() {
        let path = window.location.search.substr(1);
        path = path.split("=");
        this.title = path[1];
        this.fetchData();
    },
    methods: {
        fetchData: async function () {
            let reqData = {
                questionReq: this.title
            }
            let data = qs.stringify(reqData);
            let answer = await axios.post('../getQuestion', data, {
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                }
            });
            let dataResp = answer.data;
            if(this.isEmpty(dataResp)){
                this.loading = false; 
                this.found = true;
                this.CategoryName = "Not found";
                this.CategoryIcon = "far fa-sad-cry";
            }
            else{
                this.QuestionProp[0] = dataResp;
                this.QuestionTitle = this.QuestionProp[0].questionTitle;
                this.QuestionContent = this.QuestionProp[0].questionContent;
                this.CategoryName = this.QuestionProp[0].categoryName;
                this.CategoryIcon = this.QuestionProp[0].categoryIcon;
                this.loading = false; 
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
});