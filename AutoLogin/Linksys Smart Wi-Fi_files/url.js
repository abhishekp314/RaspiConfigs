if(!window.RAINIER){window.RAINIER={}}RAINIER.url={parseQuery:function(b){var e=b.indexOf("?");if(e===-1){return{}}var d=b.substring(e,b.length),g=d.substr(1).split("&");var f={};for(var c=0;c<g.length;c++){var a=g[c];var h=a.split("=");f[h[0]]=unescape(h[1])}return f},queryString:function(b){var a=[];$.each(b,function(c,d){a.push(c+"="+escape(d))});return a.join("&")},withoutQuery:function(a){return a.substring(0,a.indexOf("?"))},filename:function(a){a=this.withoutQuery(a);return a.substring(a.lastIndexOf("/")+1,a.length)},lpaPath:function(a){return"/applets/"+a.uuid+"/"},lpaFilePath:function(b,a,c){return"/applets/"+b.uuid+"/"+a+"?"+this.queryString(c)}};