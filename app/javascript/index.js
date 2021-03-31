

$(function(){

  $('.in_out').on('click', function() {
    $('.card-body').toggleClass("d-none");
    $('.nav-link').toggleClass("active");
  });


  $('.confirmation-btn').on('click', function() {
    $('.confirmation-btn').addClass("d-none");
    $('.confirmation').removeClass("d-none");
    $('.enter-btn').removeClass("d-none");
    $('.enter').addClass("d-none");
  });


  $('.enter-btn').on('click', function() {
    $('.enter').removeClass("d-none");
    $('.enter-btn').addClass("d-none");
    $('.confirmation-btn').removeClass("d-none");
    $('.confirmation').addClass("d-none");
  });

  $('.edit-time').on('click', function() {
    $('.edit-box').toggleClass("d-none");
    $('.edit-box').toggleClass("act");
  });

  $('input[name="sample"]').on('change', function(){
    $('.sample-change').toggleClass("d-none");
  })
  $('input[name="sample2"]').on('change', function(){
    $('.sample2-change').toggleClass("d-none");
  })
  $('.close').on('click', function(){
    $('.edit-box').addClass("d-none");
  })
  
  });