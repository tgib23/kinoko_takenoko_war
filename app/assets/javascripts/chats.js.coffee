# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#chats')
    .on 'click', '.edit, .cancel', (event) ->
      # 表示を切り替え
      toggleEditor $(this).closest('.chat')

    .on 'ajax:complete', '.edit_chat', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      body = response.data.body
      $container = $(this).closest('.chat')

      # 表示されてる値を更新
      $container.find('.viewer .body').text body

      # 表示を戻す
      toggleEditor $container

  $('#new_chat')
    .on 'ajax:complete', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      html = response.html

      # 画面に追加
      $('#chats').append html

      # フォームを初期化
      $(this)[0].reset()

# 表示モードと編集モードを切り替える。
toggleEditor = ($container) ->
  # 表示、非表示を切り替え
  $container.find('.viewer, .editor').toggle()

  # 編集モードなら、値を戻す
  $bodyField = $container.find('.editor .body')
  if $bodyField.is(':visible')
    $bodyField
      .val($container.find('.viewer .body').text())
      .select()