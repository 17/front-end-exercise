var $c, add_video_item, template, template_cache, update_width, video_item_data;

video_item_data = {
  ret: 0,
  item: [
    {
      title: 'South America',
      img: 'img/item-1@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-2@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-3@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-4@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-1@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-2@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-3@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-4@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-1@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-2@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-3@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }, {
      title: 'South America',
      img: 'img/item-4@2x.jpg',
      url: '#',
      avatar: '//placehold.it/44x44',
      author: 'Elena Smith',
      like: '234'
    }
  ]
};

template_cache = {};

template = function(template, data) {
  var content;
  content = template_cache[template];
  if (!content) {
    content = "var s='';s+='" + template.replace(/[\r\t\n]/g, " ").split("'").join("\\'").replace(/\{\{#([\w]*)\}\}(.*)\{\{\/(\1)\}\}/g, function(match, $1, $2) {
      return "';var i=0,l=data." + $1 + ".length,d=data." + $1 + ";for(;i<l;i++){s+='" + $2.replace(/\{\{(\.|this)\}\}/g, "'+d[i]+'").replace(/\{\{([\w]*)\}\}/g, "'+d[i].$1+'") + "'}s+='";
    }).replace(/\{\{(.+?)\}\}/g, "'+data.$1+'") + "';return s;";
  }
  template_cache[template] = content;
  if (data) {
    return new Function("data", content)(data);
  } else {
    return new Function("data", content);
  }
};

$c = $('.video-content');

add_video_item = function(data) {
  var video_item_template;
  video_item_template = '{{#item}} <div class="video-item"><img src="{{img}}" class="video-item__img"> <div class="video-item__over"> <div class="video-item__caption"><a href="" class="video-item__title">{{title}}</a><span class="video-item__line"></span><a href="{{url}}" class="video-item__play-button"></a></div> <div class="video-item__author"><img src="{{avatar}}" class="video-item__avatar">By<a href="" class="video-item__name">{{author}}</a></div><a href="" class="video-item__like">{{like}}</a></div> </div>{{/item}}';
  $c.append(template(video_item_template, data));
  return update_width();
};

update_width = function() {
  var cw, item_width;
  cw = $c.width();
  item_width = cw / Math.floor(cw / 300);
  return $('.video-item').width(item_width);
};

$(window).on('ready', function() {
  add_video_item(video_item_data);
  return $c.show();
}).on('resize', function() {
  return update_width();
});

$('.scroll-down__button').on('click', function(e) {
  add_video_item(video_item_data);
  return e.preventDefault();
});
