(function(){
var L={google_ad_channel:"channel",google_ad_host:"host",google_ad_region:"region",google_ad_section:"region",google_ad_type:"ad_type",google_adtest:"adtest",google_alternate_ad_url:"alternate_ad_url",google_alternate_color:"alt_color",google_bid:"bid",google_city:"gcs",google_color_bg:"color_bg",google_color_border:"color_border",google_color_line:"color_line",google_color_link:"color_link",google_color_text:"color_text",google_color_url:"color_url",google_contents:"contents",google_country:"gl",
google_cust_age:"cust_age",google_cust_ch:"cust_ch",google_cust_gender:"cust_gender",google_cust_id:"cust_id",google_cust_interests:"cust_interests",google_cust_job:"cust_job",google_cust_l:"cust_l",google_cust_lh:"cust_lh",google_cust_u_url:"cust_u_url",google_disable_video_autoplay:"disable_video_autoplay",google_ed:"ed",google_encoding:"oe",google_feedback:"feedback_link",google_flash_version:"flash",google_gl:"gl",google_hints:"hints",google_kw:"kw",google_kw_type:"kw_type",google_language:"hl",
google_referrer_url:"ref",google_region:"gr",google_reuse_colors:"reuse_colors",google_safe:"adsafe",google_targeting:"targeting",google_ui_features:"ui"},F={google_ad_format:"format",google_ad_output:"output",google_ad_callback:"callback",google_ad_override:"google_ad_override",google_ad_slot:"slotname",google_analytics_webpropids:"ga_wpids",google_correlator:"correlator",google_cpa_choice:"cpa_choice",google_image_size:"image_size",google_last_modified_time:"lmt",google_max_num_ads:"num_ads",google_max_radlink_len:"max_radlink_len",
google_num_radlinks:"num_radlinks",google_num_radlinks_per_unit:"num_radlinks_per_unit",google_only_ads_with_video:"only_ads_with_video",google_page_location:"loc",google_page_url:"url",google_rl_dest_url:"rl_dest_url",google_rl_filtering:"rl_filtering",google_rl_mode:"rl_mode",google_rt:"rt",google_skip:"skip"};function D(b){return L[b]||F[b]||null}var V=document;function Y(){var b=V.cookie,a=Math.round((new Date).getTime()/1000),d=b.indexOf("__utma=")>-1,e=b.indexOf("__utmb=")>-1,c=b.indexOf("__utmc=")>
-1,f,g={};if(d){f=b.split("__utma=")[1].split(";")[0].split(".");g.sid=(!e||!c?a:f[4])+"";g.vid=f[1]+"."+f[2];g.from_cookie=true}else{g.sid=window&&window.gaGlobal&&window.gaGlobal.sid?window.gaGlobal.sid:a+"";g.vid=window&&window.gaGlobal&&window.gaGlobal.vid?window.gaGlobal.vid:Math.round(Math.random()*2147483647)+"."+a;g.from_cookie=false}g.hid=window&&window.gaGlobal&&window.gaGlobal.hid?window.gaGlobal.hid:Math.round(Math.random()*2147483647);window.gaGlobal=g;return g}(function(){function b(){}
b.prototype.l=function(e){var c=e.indexOf("#")+1;return c?e.substr(c):""};b.prototype.n=function(e){return/[&<>\"]/.test(e)?e.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/\"/g,"&quot;"):e};b.prototype.b=function(e){var c="<iframe";for(var f in e){c+=" "+f+'="'+this.n(e[f])+'"'}return c+"></iframe>"};b.prototype.m=function(e,c){try{return e.frames[c]}catch(f){return null}};b.prototype.e=function(e){var c=document.createElement("iframe");for(var f in e){c.setAttribute(f,
e[f])}return c};b.prototype.i=function(e,c){var f=this;setTimeout(function(){document.body.appendChild(f.e({id:e,name:e,src:c,width:0,height:0,frameBorder:0}))},0)};b.prototype.r=function(e,c){var f=this;document.write(f.b({id:e,name:e,src:c,width:0,height:0,frameBorder:0}))};b.prototype.g=function(e,c){var f=[],g=e.length,k=0;while(k<g){var j=e.substr(k,c),l=j.length;if(k+l<g){for(var i=1;i<3;++i){if(j.charAt(l-i)=="%"){j=j.substr(0,l-=i)}}}f.push(j);k+=l}return f};b.prototype.a=function(e,c,f){if(!window[e]){var g=
window[e]=new c;for(var k=0;k<f.length;++k){g[f[k][0]]=f[k][1]}}};var a=b.prototype,d=[["getHash",a.l],["htmlEscape",a.n],["makeIframeTag",a.b],["getIframe",a.m],["makeIframeNode",a.e],["appendHiddenIframe",a.i],["writeHiddenIframe",a.r],["splitURIComponent",a.g],["exportSingleton",a.a],["MAX_URL_LENGTH",4095],["IDI_DEFAULT_POLLING_INTERVAL",1000]];b.prototype.a("IDICommon",b,d)})();(function(){function b(c,f){for(var g in f){c[g]=f[g]}}function a(){var c=this;c.s=window.location.href.replace(/([^:\/])\/.*$/,
"$1/robots.txt");c.t="";c.k={};c.c={};c.f={};c.u={};c.o={}}a.prototype.w=function(c,f,g){var k;if(typeof g=="object"){k=g.moduleRelayUrl}var j=this,l=j.c[c];if(isNaN(l)){throw new Error("Invalid module id");}else{var i=typeof k=="string"?k:j.d(j.u[c]),o=encodeURIComponent(f)+"$",q=IDICommon.MAX_URL_LENGTH-1-i.length,r=IDICommon.g(o,q),t=r.length;for(var p=0;p<t;++p){IDICommon.i(c+"_"+(l+p),i+"#"+r[p])}j.c[c]+=t}};a.prototype.p=function(c,f,g){var k=this;k.h(c);k.o[c]=window.setInterval(function(){k.v(c,
f)},typeof g=="object"&&g.pollingInterval||IDICommon.IDI_DEFAULT_POLLING_INTERVAL)};a.prototype.h=function(c){var f=this;window.clearInterval(f.o[c]);f.o[c]=0};a.prototype.x=function(c){this.s=c};a.prototype.q=function(c){this.t=c};a.prototype.d=function(c){return this.t||c.replace(/([^:\/]\/).*$/,"$1ig/idi_relay")};a.prototype.v=function(c,f){var g=this,k=window.frames[c];if(k){var j;while(j=IDICommon.m(k,c+"_"+g.k[c])){try{if(j.location.href=="about:blank"){break}}catch(l){break}g.f[c]+=IDICommon.l(j.location.href);
++g.k[c]}var i=g.f[c].split("$"),o=i.length-1;if(o>0){g.f[c]=i[o];for(var q=0;q<o;++q){f(decodeURIComponent(i[q]),c)}}}};a.prototype.j=function(c,f,g,k,j){var l=this,i={frameBorder:0,scrolling:"no"},o,q,r,t,p;if(typeof j=="object"){o=j.iframeAttrs;q=j.callback;r=j.userPrefs;t=j.pollingInterval;p=j.parentDivId}if(typeof o=="object"){b(i,o)}b(i,{id:f,name:f,src:c,width:g,height:k});l.k[f]=0;l.c[f]=0;l.f[f]="";l.u[f]=c;var v=[];if(typeof r=="object"){for(var s in r){v.push(encodeURIComponent(s)+"="+
encodeURIComponent(r[s]))}}if(typeof q=="function"){v.push("idi_hr="+encodeURIComponent(l.s));l.p(f,q,j)}if(v.length){var y=v.join("&");if(i.src.length+1+y.length>IDICommon.MAX_URL_LENGTH){y+="$";var G=l.d(c),R=IDICommon.MAX_URL_LENGTH-1-G.length,H=IDICommon.g(y,R),I=H.length;for(var s=0;s<I;++s){var C=f+"_"+s,J=G+"#"+H[s];if(p){var z=document.getElementById(p);z.innerHTML=z.innerHTML+l.e({id:C,name:C,src:J,width:0,height:0,frameBorder:0})}else{IDICommon.r(C,J)}}l.c[f]+=I;y=""}i.src+="#"+y}if(p){var z=
document.getElementById(p);z.innerHTML=z.innerHTML+IDICommon.b(i)}else{document.write(IDICommon.b(i))}};var d=a.prototype,e=[["setHostRelayUrl",d.x],["setModuleRelayUrl",d.q],["getModuleRelayUrl",d.d],["createModule",d.j],["postMessageToModule",d.w],["registerListener",d.p],["unregisterListener",d.h]];IDICommon.a("IDIHost",a,e)})();function w(b){return b!=null?'"'+b+'"':'""'}function W(b){if(typeof encodeURIComponent=="function"){return encodeURIComponent(b)}else{return escape(b)}}function m(b,a){if(b&&
a){window.google_ad_url+="&"+b+"="+a}}function h(b){var a=window,d=D(b),e=a[b];m(d,e)}function u(b,a){if(a){m(b,W(a))}}function n(b){var a=window,d=D(b),e=a[b];u(d,e)}function x(b,a){var d=window,e=D(b),c=d[b];if(e&&c&&typeof c=="object"){c=c[a%c.length]}m(e,c)}function Z(b,a){var d=b.screen,e=navigator.javaEnabled(),c=-a.getTimezoneOffset();if(d){m("u_h",d.height);m("u_w",d.width);m("u_ah",d.availHeight);m("u_aw",d.availWidth);m("u_cd",d.colorDepth)}m("u_tz",c);m("u_his",history.length);m("u_java",
e);if(navigator.plugins){m("u_nplug",navigator.plugins.length)}if(navigator.mimeTypes){m("u_nmime",navigator.mimeTypes.length)}}function E(b){if(b){b=b.toLowerCase();if(b.substring(0,3)!="ca-"){b="ca-"+b}}return b}function ca(b){if(b){b=b.toLowerCase();if(b.substring(0,9)!="dist-aff-"){b="dist-aff-"+b}}return b}function ga(b,a){var d=document.getElementById(b);d.style.height=a+"px"}function $(b,a,d){window.clearTimeout(d);var e=/^google_resize_flash_ad_idi\((\d+)\)/,c=b.match(e);if(c){ga(a,c[1])}}
function ha(b,a,d,e){d=d.substring(0,2000);d=d.replace(/%\w?$/,"");if((b.google_ad_output=="js"||b.google_ad_output=="json_html")&&(b.google_ad_request_done||b.google_radlink_request_done)){a.write('<script language="JavaScript1.1" src='+w(d)+"><\/script>")}else if(b.google_ad_output=="html"){if(b.name!="google_ads_frame"){if(e!=null){a.write('<div id="'+e+'">')}if(aa(b.google_ad_output,b.google_ad_client)){IDIHost.q("http://pagead2.googlesyndication.com/pagead/idi_relay.html");var c=0;if(b.google_num_0ad_slots){c+=
b.google_num_0ad_slots}if(b.google_num_ad_slots){c+=b.google_num_ad_slots}if(b.google_num_sdo_slots){c+=b.google_num_sdo_slots}var f="google_inline_div"+c,g="<div id="+w(f)+' style="position:relative;width:'+b.google_ad_width+'px"></div><div style="position:relative;width:'+b.google_ad_width+"px;height:"+b.google_ad_height+'px;z-index:-1"></div>';a.write(g);var k="google_frame"+c,j=b.setTimeout(function(){IDIHost.h(k)},5000);IDIHost.j(d,k,b.google_ad_width,b.google_ad_height,{callback:function(l,
i){$(l,i,j)},pollingInterval:500,iframeAttrs:{style:"position: absolute;left:0px",marginWidth:"0",marginHeight:"0",vspace:"0",hspace:"0",allowTransparency:"true"},parentDivId:f})}else{a.write('<iframe name="google_ads_frame" width='+w(b.google_ad_width)+" height="+w(b.google_ad_height)+" frameborder="+w(b.google_ad_frameborder)+" src="+w(d)+' marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no">');a.write("</iframe>")}if(e!=null){a.write("</div>")}}}else if(b.google_ad_output==
"textlink"){a.write('<script language="JavaScript1.1" src='+w(d)+"><\/script>")}}function fa(b){for(var a in L){b[a]=null}for(var a in F){b[a]=null}}function ia(b){if(b.google_ad_format){return b.google_ad_format.indexOf("_0ads")>0}return b.google_ad_output!="html"&&b.google_num_radlinks>0}function A(b){return b&&b.indexOf("_sdo")!=-1}function T(){var b=null,a=window,d=document,e=new Date,c=e.getTime(),f=a.google_ad_format;if(a.google_cpa_choice!=b){a.google_ad_url="http://pagead2.googlesyndication.com/cpa/ads?";
a.google_ad_url+="client="+escape(E(a.google_ad_client));a.google_ad_region="_google_cpa_region_";h("google_cpa_choice");if(typeof d.characterSet!="undefined"){u("oe",d.characterSet)}else if(typeof d.charset!="undefined"){u("oe",d.charset)}}else if(A(f)){a.google_ad_url="http://pagead2.googlesyndication.com/pagead/sdo?";a.google_ad_url+="client="+escape(ca(a.google_ad_client))}else{a.google_ad_url="http://pagead2.googlesyndication.com/pagead/ads?";a.google_ad_url+="client="+escape(E(a.google_ad_client))}h("google_ad_host");
var g=a.google_num_slots_by_client,k=a.google_num_slots_by_channel,j=a.google_prev_ad_formats_by_region,l=a.google_prev_ad_slotnames_by_region;if(a.google_ad_region==b&&a.google_ad_section!=b){a.google_ad_region=a.google_ad_section}var i=a.google_ad_region==b?"":a.google_ad_region;if(A(f)){if(a.google_num_sdo_slots){a.google_num_sdo_slots=a.google_num_sdo_slots+1}else{a.google_num_sdo_slots=1}if(a.google_num_sdo_slots>4){return false}}else if(ia(a)){if(a.google_num_0ad_slots){a.google_num_0ad_slots=
a.google_num_0ad_slots+1}else{a.google_num_0ad_slots=1}if(a.google_num_0ad_slots>3){return false}}else if(a.google_cpa_choice==b){if(a.google_num_ad_slots){a.google_num_ad_slots=a.google_num_ad_slots+1}else{a.google_num_ad_slots=1}if(a.google_num_slots_to_rotate){j[i]=b;l[i]=b;if(a.google_num_slot_to_show==b){a.google_num_slot_to_show=c%a.google_num_slots_to_rotate+1}if(a.google_num_slot_to_show!=a.google_num_ad_slots){return false}}else if(a.google_num_ad_slots>6&&i==""){return false}}m("dt",e.getTime());
h("google_language");if(a.google_country){h("google_country")}else{h("google_gl")}h("google_region");n("google_city");n("google_hints");h("google_safe");h("google_encoding");h("google_last_modified_time");n("google_alternate_ad_url");h("google_alternate_color");h("google_skip");h("google_targeting");var o=a.google_ad_client;if(!g[o]){g[o]=1;g.length+=1}else{g[o]+=1}if(j[i]){if(!A(f)){u("prev_fmts",j[i].toLowerCase());if(g.length>1){m("slot",g[o])}}}if(l[i]){u("prev_slotnames",l[i].toLowerCase())}if(f&&
!a.google_ad_slot){u("format",f.toLowerCase());if(!A(f)){if(j[i]){j[i]=j[i]+","+f}else{j[i]=f}}}if(a.google_ad_slot){if(l[i]){l[i]=l[i]+","+a.google_ad_slot}else{l[i]=a.google_ad_slot}}h("google_max_num_ads");m("output",a.google_ad_output);h("google_adtest");h("google_ad_callback");h("google_ad_slot");n("google_correlator");if(a.google_ad_channel){n("google_ad_channel");var q="",r=a.google_ad_channel.split("+");for(var t=0;t<r.length;t++){var p=r[t];if(!k[p]){k[p]=1}else{q+=p+"+"}}u("pv_ch",q)}n("google_page_url");
x("google_color_bg",c);x("google_color_text",c);x("google_color_link",c);x("google_color_url",c);x("google_color_border",c);x("google_color_line",c);if(a.google_reuse_colors)m("reuse_colors",1);else m("reuse_colors",0);h("google_kw_type");n("google_kw");n("google_contents");h("google_num_radlinks");h("google_max_radlink_len");h("google_rl_filtering");h("google_rl_mode");h("google_rt");n("google_rl_dest_url");h("google_num_radlinks_per_unit");h("google_ad_type");h("google_image_size");h("google_ad_region");
h("google_feedback");n("google_referrer_url");n("google_page_location");h("google_bid");h("google_cust_age");h("google_cust_gender");h("google_cust_interests");h("google_cust_id");h("google_cust_job");h("google_cust_u_url");h("google_cust_l");h("google_cust_lh");h("google_cust_ch");h("google_ed");n("google_ui_features");n("google_only_ads_with_video");n("google_disable_video_autoplay");if(O(a,d)&&d.body){var v=d.body.scrollHeight,s=d.body.clientHeight;if(s&&v){u("cc",Math.round(s*100/v))}}Y();m("ga_vid",
a.gaGlobal.vid);m("ga_sid",a.gaGlobal.sid);m("ga_hid",a.gaGlobal.hid);m("ga_fc",a.gaGlobal.from_cookie);n("google_analytics_webpropids");h("google_ad_override");h("google_flash_version");Z(a,e);return true}function P(){var b=window,a=document;if(!T()){return}ha(b,a,b.google_ad_url,null);fa(b)}function X(b,a,d){P();return true}function O(b,a){return b.top.location==a.location}function N(b,a){var d=a.documentElement;if(O(b,a))return false;if(b.google_ad_width&&b.google_ad_height){var e=1,c=1;if(b.innerHeight){e=
b.innerWidth;c=b.innerHeight}else if(d&&d.clientHeight){e=d.clientWidth;c=d.clientHeight}else if(a.body){e=a.body.clientWidth;c=a.body.clientHeight}if(c>2*b.google_ad_height||e>2*b.google_ad_width){return false}}return true}function ba(b){var a=window,d=null,e=a.onerror;a.onerror=b;if(a.google_ad_frameborder==d){a.google_ad_frameborder=0}if(a.google_ad_output==d){a.google_ad_output="html"}if(A(a.google_ad_format)){var c=a.google_ad_format.match(/^(\d+)x(\d+)_.*/);if(c){a.google_ad_width=parseInt(c[1]);
a.google_ad_height=parseInt(c[2]);a.google_ad_output="html"}}if(a.google_ad_format==d&&a.google_ad_output=="html"){a.google_ad_format=a.google_ad_width+"x"+a.google_ad_height}S(a,document);if(a.google_num_slots_by_channel==d){a.google_num_slots_by_channel=[]}if(a.google_num_slots_by_client==d){a.google_num_slots_by_client=[]}if(a.google_prev_ad_formats_by_region==d){a.google_prev_ad_formats_by_region=[]}if(a.google_prev_ad_slotnames_by_region==d){a.google_prev_ad_slotnames_by_region=[]}if(a.google_correlator==
d){a.google_correlator=(new Date).getTime()}if(a.google_adslot_loaded==d){a.google_adslot_loaded={}}if(a.google_adContentsBySlot==d){a.google_adContentsBySlot={}}if(a.google_flash_version==d){a.google_flash_version=U().toString()}a.onerror=e}function Q(b){if(b in B){return B[b]}return B[b]=navigator.userAgent.toLowerCase().indexOf(b)!=-1}var B={};function aa(b,a){if(b!="html"){return false}var d={};d["ca-pub-7027491298716603"]=true;d["ca-pub-8344185808443527"]=true;d["ca-pub-9812682548211238"]=true;
d["ca-pub-4424308218891706"]=true;d["ca-pub-6922559858235084"]=true;d["ca-pub-6477563040863705"]=true;d["ca-google"]=true;return d[E(a)]!=null}function ea(b){var a={},d=b.split("?"),e=d[d.length-1].split("&");for(var c=0;c<e.length;c++){var f=e[c].split("=");if(f[0]){try{a[f[0].toLowerCase()]=f.length>1?(window.decodeURIComponent?decodeURIComponent(f[1].replace(/\+/g," ")):unescape(f[1])):""}catch(g){}}}return a}function da(){var b=window,a=ea(document.URL);if(a.google_ad_override){b.google_ad_override=
a.google_ad_override}}function U(){var b=0;if(navigator.plugins&&navigator.mimeTypes.length){var a=navigator.plugins["Shockwave Flash"];if(a&&a.description){b=a.description.replace(/([a-zA-Z]|\s)+/,"").split(".")[0]}}else if(navigator.userAgent&&navigator.userAgent.indexOf("Windows CE")>=0){b=3;var d=1;while(d){try{d=new ActiveXObject("ShockwaveFlash.ShockwaveFlash."+(b+1));b++}catch(e){d=null}}}else if(Q("msie")&&!window.opera){try{var d=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(e){try{var d=
new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");b=6;d.AllowScriptAccess="always"}catch(e){if(b==6){return b}}try{d=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(e){}}if(d!=null){b=d.GetVariable("$version").split(" ")[1].split(",")[0]}}return b}function S(b,a){if(b.google_page_url==null){if(M[a.domain]&&a.domain==K){var d=a.URL.substring(a.URL.lastIndexOf("http"));b.google_page_url=d;b.google_page_location=a.location;b.google_referrer_url=d}else{b.google_page_url=a.referrer;if(!N(b,
a)){b.google_page_url=a.location;b.google_last_modified_time=Date.parse(a.lastModified)/1000;b.google_referrer_url=a.referrer}}}else{b.google_page_location=a.referrer;if(!N(b,a)){b.google_page_location=a.location}}}var K="ad.yieldmanager.com",M={};M[K]=true;da();ba(X);P();
})()
