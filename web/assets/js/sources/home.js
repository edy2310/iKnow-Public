import Vue from 'vue/dist/vue'; //Development
//import Vue from 'vue/dist/vue.min'; //Production

var grid_categories = new Vue({
    el: '#grid-categories',
    data: {
        categories: [],
        loading: true
    },
    mounted() {
        this.fetchData();            
    },
    methods: {
        fetchData: async function () {
            let answer = await fetch("./getCategories");
            let data = await answer.json();
            for(let category in data){
                let categoryToAdd = {
                    name: category,
                    link: "/category?title=" + category,
                    iconClass: data[category]
                }
                this.categories.push(categoryToAdd);
            }
            this.loading = false;
        } 
    }
})