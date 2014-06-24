module ApplicationHelper
  def bookmarklet_js
    code = <<-eos
      javascript:
        (function(){
          if (window.Bitchmark!==undefined) {
            new Bitchmark.Views.Bookmarklet({el: 'body', hashId: '#{params[:hash_id]}'});
          } else {
            var script = document.createElement('script');
            script.setAttribute('src', '#{bookmarklet_path}');
            document.body.appendChild(script);
            script.onload = script.onreadystatechange = function() {
              var rs = script.readyState;
              if (!rs || rs === 'loaded' || rs === 'complete') {
                script.onload = script.onreadystatechange = null;
                new Bitchmark.Views.Bookmarklet({el: 'body', hashId: '#{params[:hash_id]}'});
              }
            };
          }
        })();
    eos
    raw(code.squish)
  end

  def bookmarklet_path
    "//#{request.env['HTTP_HOST']}#{javascript_path('bookmarklet_manifest')}"
  end
end
