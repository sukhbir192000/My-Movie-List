/**
 *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
 *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
/*
var disqus_config = function () {
this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};
*/
function showDisqus() {
  // DON'T EDIT BELOW THIS LINE
  if (loaded) return;
  var d = document,
    s = d.createElement("script");
  s.src = "https://mymovielist.disqus.com/embed.js";
  s.setAttribute("data-timestamp", +new Date());
  (d.head || d.body).appendChild(s);
  loaded = true;
}

const commentButton = document.getElementById("comments-button");
let loaded = false;
commentButton.addEventListener("click", showDisqus);
