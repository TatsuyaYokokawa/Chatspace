$(function(){
  function buildHTML(message){
    if ( message.image ) {
      var html =
      `<div class="main__contents__content">
        <div class="main__contents__content__message-info">
          <div class="main__contents__content__message-info__user-name">
            ${message.account_name}
          </div>
          <div class="main__contents__content__message-info__post-time">
            ${message.created_at}
          </div>
        </div>
          <div class="main__contents__content__message-text">
            <p class="main__contents__content__message-text__content">
              ${message.content}
            </p>
          </div>
          <img src=${message.image} >
        </div>`
      return html;
      } else {
      var html =
      `<div class="main__contents__content">
        <div class="main__contents__content__message-info">
          <div class="main__contents__content__message-info__user-name">
            ${message.account_name}
          </div>
          <div class="main__contents__content__message-info__post-time">
            ${message.created_at}
          </div>
        </div>
        <div class="main__contents__content__message-text">
          <p class="main__contents__content__message-text__text-content">
            ${message.content}
          </p>
        </div>
      </div>`
    return html;
    };
  }

  $("#new_messagexx").on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.main__contents').append(html);
      $('.main__contents').animate({ scrollTop: $('.main__contents')[0].scrollHeight});      
      $('form')[0].reset();
      $(".main__footer__text-space__send-btn").prop('disabled', false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $(".main__footer__text-space__send-btn").prop('disabled', false);
    });
  });
});