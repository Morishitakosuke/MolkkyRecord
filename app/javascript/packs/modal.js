import Vue from 'vue/dist/vue.esm'

document.addEventListener("turbolinks:load" , () => {
  const modal = new Vue({
    el: '#modal',
    data:{
      showContent: false
    },
    methods:{
      openModal: function(){
        this.showContent = true
      },
      closeModal: function(){
        this.showContent = false
      }
    }
  })
})
