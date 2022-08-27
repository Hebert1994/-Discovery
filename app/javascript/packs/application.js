// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import * as bootstrap from 'bootstrap'
import "../stylesheets/application"

$(function(){
	$('.b-slogan__button-play').magnificPopup({
		//delegate: '.b-slogan__url', // child items selector, by clicking on it popup will open
		type: 'iframe',
		tLoading: 'Loading video #%curr%...',
		modal:false,
		markup: '<div class="mfp-iframe-scaler">'+
            '<iframe class="mfp-iframe" frameborder="0" allowfullscreen></iframe>'+
          '</div>', 
		callbacks:{
			open: function(){
				$('.mfp-close').remove();//удаление старой кнопки
				$('<button title="" type="button" class="mfp-close"></button>').appendTo('.mfp-container');
				//var content = $(".mfp-iframe");
			}
		}
	});
});
