tinymce.PluginManager.add("autoresize",function(e){function t(i){var o,a,s=e.getDoc(),l=s.body,c=s.documentElement,u=tinymce.DOM,d=n.autoresize_min_height;"setcontent"==i.type&&i.initial||e.plugins.fullscreen&&e.plugins.fullscreen.isFullscreen()||(a=tinymce.Env.ie?l.scrollHeight:tinymce.Env.webkit&&0===l.clientHeight?0:l.offsetHeight,a>n.autoresize_min_height&&(d=a),n.autoresize_max_height&&a>n.autoresize_max_height?(d=n.autoresize_max_height,l.style.overflowY="auto",c.style.overflowY="auto"):(l.style.overflowY="hidden",c.style.overflowY="hidden",l.scrollTop=0),d!==r&&(o=d-r,u.setStyle(u.get(e.id+"_ifr"),"height",d+"px"),r=d,tinymce.isWebKit&&0>o&&t(i)))}var n=e.settings,r=0;n.autoresize_min_height=parseInt(e.getParam("autoresize_min_height",e.getElement().offsetHeight),10),n.autoresize_max_height=parseInt(e.getParam("autoresize_max_height",0),10),e.on("init",function(){e.dom.setStyle(e.getBody(),"paddingBottom",e.getParam("autoresize_bottom_margin",50)+"px")}),e.on("change setcontent paste keyup",t),e.getParam("autoresize_on_init",!0)&&e.on("load",t),e.addCommand("mceAutoResize",t)});