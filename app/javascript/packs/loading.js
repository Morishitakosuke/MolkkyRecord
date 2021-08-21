$(window).on('turbolinks:load',function(){
  $("#loading").delay(600).fadeOut('slow');//ローディング画面を1.5秒（1500ms）待機してからフェードアウト
  $("#loading_box").delay(400).fadeOut('slow');//ローディングテキストを1.2秒（1200ms）待機してからフェードアウト
});