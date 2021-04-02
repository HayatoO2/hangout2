

$(function(){

  $('.in_member').on('click', function() {
    $('.in_body').removeClass("d-none");
    $('.out_body').addClass("d-none");
    $('.nav-in').addClass("active");
    $('.nav-out').removeClass("active");
  });
  $('.out_member').on('click', function() {
    $('.out_body').removeClass("d-none");
    $('.in_body').addClass("d-none");
    $('.nav-out').addClass("active");
    $('.nav-in').removeClass("active");
  });


  $('.confirmation-btn').on('click', function() {
    $('.confirmation').toggleClass("d-none");
    $('.enter').addClass("d-none");
    $('.owner').addClass("d-none");
  });
  $('.owner-btn').on('click', function() {
    $('.owner').toggleClass("d-none");
    $('.enter').addClass("d-none");
    $('.confirmation').addClass("d-none");
  });


  $('.enter-btn').on('click', function() {
    $('.enter').toggleClass("d-none");
    $('.confirmation').addClass("d-none");
    $('.owner').addClass("d-none");
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
  });
  $('.close').on('click', function(){
    $('.edit-box').addClass("d-none");
  });

  
  });