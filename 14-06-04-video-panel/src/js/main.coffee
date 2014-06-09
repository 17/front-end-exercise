video_item_data =
  ret : 0
  item : [
    {
      title: 'South America'
      img: 'img/item-1@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-2@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-3@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-4@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-1@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-2@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-3@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-4@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-1@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-2@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-3@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
    {
      title: 'South America'
      img: 'img/item-4@2x.jpg'
      url: '#'
      avatar: '//placehold.it/44x44'
      author: 'Elena Smith'
      like: '234'
    }
  ]

template_cache = {}
template = (template, data) ->
    content = template_cache[template]
    unless content
        content = "var s='';s+='" + template.replace(/[\r\t\n]/g, " ").split("'").join("\\'").replace(/\{\{#([\w]*)\}\}(.*)\{\{\/(\1)\}\}/g, (match, $1, $2) ->
            "';var i=0,l=data." + $1 + ".length,d=data." + $1 + ";for(;i<l;i++){s+='" + $2.replace(/\{\{(\.|this)\}\}/g, "'+d[i]+'").replace(/\{\{([\w]*)\}\}/g, "'+d[i].$1+'") + "'}s+='"
    ).replace(/\{\{(.+?)\}\}/g, "'+data.$1+'") + "';return s;"
    template_cache[template] = content
    (if data then new Function("data", content)(data) else new Function("data", content))

$c = $ '.video-content'

add_video_item = (data)->
  video_item_template = '{{#item}}
  <div class="video-item"><img src="{{img}}" class="video-item__img">
     <div class="video-item__over">
        <div class="video-item__caption"><a href="" class="video-item__title">{{title}}</a><span class="video-item__line"></span><a href="{{url}}" class="video-item__play-button"></a></div>
        <div class="video-item__author"><img src="{{avatar}}" class="video-item__avatar">By<a href="" class="video-item__name">{{author}}</a></div><a href="" class="video-item__like">{{like}}</a></div>
  </div>{{/item}}'
  $c.append template video_item_template, data
  update_width()

update_width = ->
  cw = $c.width()
  item_width = cw / Math.floor cw / 300
  $ '.video-item'
    .width(item_width)

$ window
  .on 'ready', ->
    add_video_item video_item_data
    $c.show()
  .on 'resize', ->
    update_width()

$ '.scroll-down__button'
  .on 'click', (e)->
    add_video_item video_item_data
    e.preventDefault()