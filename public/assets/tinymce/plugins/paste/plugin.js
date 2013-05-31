(function(e,t){"use strict";function n(e,t){for(var n,r=[],i=0;e.length>i;++i){if(n=s[e[i]]||o(e[i]),!n)throw"module definition dependecy not found: "+e[i];r.push(n)}t.apply(null,r)}function r(e,r,i){if("string"!=typeof e)throw"invalid module definition, module id must be defined and be a string";if(r===t)throw"invalid module definition, dependencies must be specified";if(i===t)throw"invalid module definition, definition function must be specified";n(r,function(){s[e]=i.apply(null,arguments)})}function i(e){return!!s[e]}function o(t){for(var n=e,r=t.split(/[.\/]/),i=0;r.length>i;++i){if(!n[r[i]])return;n=n[r[i]]}return n}function a(n){for(var r=0;n.length>r;r++){for(var i=e,o=n[r],a=o.split(/[.\/]/),l=0;a.length-1>l;++l)i[a[l]]===t&&(i[a[l]]={}),i=i[a[l]];i[a[a.length-1]]=s[o]}}var s={},l="tinymce/pasteplugin/Clipboard",c="tinymce/Env",u="tinymce/util/Tools",d="tinymce/util/VK",f="tinymce/pasteplugin/WordFilter",p="tinymce/html/DomParser",m="tinymce/html/Schema",h="tinymce/html/Serializer",g="tinymce/html/Node",v="tinymce/pasteplugin/Quirks",y="tinymce/pasteplugin/Plugin",b="tinymce/PluginManager";r(l,[c,u,d],function(e,n,r){function i(){return!e.gecko&&("ClipboardEvent"in window||e.webkit&&"FocusEvent"in window)}return function(o){function a(){return 100>(new Date).getTime()-f}function s(e,t){return n.each(t,function(t){e=t.constructor==RegExp?e.replace(t,""):e.replace(t[0],t[1])}),e}function l(t){var n=o.fire("PastePreProcess",{content:t});(o.settings.paste_remove_styles||o.settings.paste_remove_styles_if_webkit!==!1&&e.webkit)&&(n.content=n.content.replace(/ style=\"[^\"]+\"/g,"")),n.isDefaultPrevented()||o.insertContent(n.content)}function c(e){e=o.dom.encode(e),e=s(e,[[/\n\n/g,"</p><p>"],[/^(.*<\/p>)(<p>)$/,"<p>$1"],[/\n/g,"<br />"]]);var t=o.fire("PastePreProcess",{content:e});t.isDefaultPrevented()||o.insertContent(t.content)}function u(){var e=(o.inline?o.getBody():o.getDoc().documentElement).scrollTop,t=o.dom.add(o.getBody(),"div",{id:"mcePasteBin",contentEditable:!1,style:"position: absolute; top: "+e+"px; left: 0; background: red; width: 1px; height: 1px; overflow: hidden"},'<div contentEditable="true">X</div>');return t}function d(){var e=o.dom.get("mcePasteBin");o.dom.unbind(e),o.dom.remove(e)}var f;o.on("keydown",function(e){e.shiftKey&&86==e.keyCode&&(f=(new Date).getTime())}),i()?o.on("paste",function(e){function t(e,t){for(var r=0;n.types.length>r;r++)if(n.types[r]==e)return t(n.getData(e)),!0}var n=e.clipboardData;n&&(e.preventDefault(),a()?t("text/plain",c)||t("text/html",l):t("text/html",l)||t("text/plain",c))}):e.ie?o.on("init",function(){var e=o.dom;o.dom.bind(o.getBody(),"paste",function(n){var r;if(n.preventDefault(),a()&&e.doc.dataTransfer)return c(e.doc.dataTransfer.getData("Text")),t;var i=u();e.bind(i,"paste",function(e){e.stopPropagation(),r=!0});var s=o.selection.getRng(),f=e.doc.body.createTextRange();if(f.moveToElementText(i.firstChild),f.execCommand("Paste"),d(),!r)return o.windowManager.alert("Clipboard access not possible."),t;var p=i.firstChild.innerHTML;o.selection.setRng(s),l(p)})}):(o.on("init",function(){o.dom.bind(o.getBody(),"paste",function(e){e.preventDefault(),o.windowManager.alert("Please use Ctrl+V/Cmd+V keyboard shortcuts to paste contents.")})}),o.on("keydown",function(e){if(r.metaKeyPressed(e)&&86==e.keyCode&&!e.isDefaultPrevented()){var t=u(),n=o.selection.getRng();o.selection.select(t,!0),o.dom.bind(t,"paste",function(e){e.stopPropagation(),setTimeout(function(){d(),o.lastRng=n,o.selection.setRng(n),l(t.firstChild.innerHTML)},0)})}})),o.paste_block_drop&&o.on("dragend dragover draggesture dragdrop drop drag",function(e){e.preventDefault(),e.stopPropagation()}),this.paste=l,this.pasteText=c}}),r(f,[u,p,m,h,g],function(e,n,r,i,o){return function(a){var s=e.each;a.on("PastePreProcess",function(l){function c(e){s(e,function(e){f=e.constructor==RegExp?f.replace(e,""):f.replace(e[0],e[1])})}function u(e){function t(e,t,a,s){var l=e._listLevel||i;l!=i&&(i>l?n&&(n=n.parent.parent):(r=n,n=null)),n&&n.name==a?n.append(e):(r=r||n,n=new o(a,1),s>1&&n.attr("start",""+s),e.wrap(n)),e.name="li",t.value="";var c=t.next;c&&3==c.type&&(c.value=c.value.replace(/^\u00a0+/,"")),l>i&&r.lastChild.append(n),i=l}for(var n,r,i=1,a=e.getAll("p"),s=0;a.length>s;s++)if(e=a[s],"p"==e.name&&e.firstChild){for(var l="",c=e.firstChild;c&&!(l=c.value);)c=c.firstChild;if(/^\s*[\u2022\u00b7\u00a7\u00d8o\u25CF]\s*$/.test(l)){t(e,c,"ul");continue}if(/^\s*\w+\./.test(l)){var u=/([0-9])\./.exec(l),d=1;u&&(d=parseInt(u[1],10)),t(e,c,"ol",d);continue}n=null}}function d(n,r){if("p"===n.name){var i=/mso-list:\w+ \w+([0-9]+)/.exec(r);i&&(n._listLevel=parseInt(i[1],10))}if(a.getParam("paste_retain_style_properties","none")){var o="";if(e.each(a.dom.parseStyle(r),function(e,n){switch(n){case"horiz-align":return n="text-align",t;case"vert-align":return n="vertical-align",t;case"font-color":case"mso-foreground":return n="color",t;case"mso-background":case"mso-highlight":n="background"}("all"==p||m&&m[n])&&(o+=n+":"+e+";")}),o)return o}return null}var f=l.content,p,m;if(p=a.settings.paste_retain_style_properties,p&&(m=e.makeMap(p)),a.settings.paste_enable_default_filters!==!1&&/class="?Mso|style="[^"]*\bmso-|style='[^'']*\bmso-|w:WordDocument/i.test(l.content)){l.wordContent=!0,c([/<!--[\s\S]+?-->/gi,/<(!|script[^>]*>.*?<\/script(?=[>\s])|\/?(\?xml(:\w+)?|img|meta|link|style|\w:\w+)(?=[\s\/>]))[^>]*>/gi,[/<(\/?)s>/gi,"<$1strike>"],[/&nbsp;/gi,"\u00a0"],[/<span\s+style\s*=\s*"\s*mso-spacerun\s*:\s*yes\s*;?\s*"\s*>([\s\u00a0]*)<\/span>/gi,function(e,t){return t.length>0?t.replace(/./," ").slice(Math.floor(t.length/2)).split("").join("\u00a0"):""}]]);var h=new r({valid_elements:"@[style],-strong/b,-em/i,-span,-p,-ol,-ul,-li,-h1,-h2,-h3,-h4,-h5,-h6,-table,-tr,-td[colspan|rowspan],-th,-thead,-tfoot,-tbody,-a[!href]"}),g=new n({},h);g.addAttributeFilter("style",function(e){for(var t=e.length,n;t--;)n=e[t],n.attr("style",d(n,n.attr("style"))),"span"!=n.name||n.attributes.length||n.unwrap()});var v=g.parse(f);u(v),l.content=new i({},h).serialize(v)}})}}),r(v,[c,u],function(e,t){return function(n){function r(e){n.on("PastePreProcess",function(t){t.content=e(t.content)})}function i(e,n){return t.each(n,function(t){e=t.constructor==RegExp?e.replace(t,""):e.replace(t[0],t[1])}),e}function o(e){return e=i(e,[/^[\s\S]*<!--StartFragment-->|<!--EndFragment-->[\s\S]*$/g,[/<span class="Apple-converted-space">\u00a0<\/span>/g,"\u00a0"],/<br>$/])}function a(e){if(!this.explorerBlocksRegExp){var r=[];t.each(n.schema.getBlockElements(),function(e,t){r.push(t)}),this.explorerBlocksRegExp=RegExp("(?:<br>&nbsp;[\\s\\r\\n]+|<br>)*(</?("+r.join("|")+")[^>]*>)(?:<br>&nbsp;[\\s\\r\\n]+|<br>)*","g")}return e=i(e,[[this.explorerBlocksRegExp,"$1"]]),e=i(e,[[/<br><br>/g,"<BR><BR>"],[/<br>/g," "],[/<BR><BR>/g,"<br>"]])}e.webkit&&r(o),e.ie&&r(a)}}),r(y,[b,l,f,v],function(e,t,n,r){e.add("paste",function(e){var i=this;i.clipboard=new t(e),i.quirks=new r(e),i.wordFilter=new n(e),e.addCommand("mceInsertClipboardContent",function(e,t){t.content&&i.clipboard.paste(t.content),t.text&&i.clipboard.pasteText(t.text)})})}),a([l,f,v,y])})(this);