'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/lib/assets/fonts/NeueKonstantGrotesk-Book.otf": "6bc76435d634c868a5d589f3b1811a83",
"assets/lib/assets/images/pokeutils_logo.png": "fe7a71639db405162432c569d92f076e",
"assets/lib/assets/images/sudosumo_logo.png": "a7112f3b4d725466bc91ff95ce129b93",
"assets/lib/assets/images/ts_logo.svg": "ab9682152372e735655e59914d3b0c3a",
"assets/lib/assets/images/background_cover.png": "29dfc161694fbbb98786f759f8da34b4",
"assets/lib/assets/images/lotus.png": "4ef3f733c02fb032c03b0799793433aa",
"assets/lib/assets/images/testmaster.png": "4727ec1d78db25ef6c56eca793f2474d",
"assets/lib/assets/images/background_cover.svg": "ea493e3204eb488a98a47fbee6cfbfeb",
"assets/lib/assets/images/profile.png": "8cc701081bf130b79b6286013dd3b626",
"assets/lib/assets/images/grain.png": "ad242e18da0eaf285f50e277001ad13c",
"assets/lib/assets/images/react_logo.svg": "4e49d31238c92806dd6ccf7a2b83b8dc",
"assets/lib/assets/images/profile2.jpg": "6dd2216862238ffe4e358418eea0816a",
"assets/lib/assets/images/python_logo.svg": "a1872cef0fb917ddf4d387e298d9f160",
"assets/lib/assets/docs/CV.pdf": "bd7644fa1673ee9894e922e4c1022eb3",
"assets/lib/assets/data/diploma.json": "4903047ddd49315d3ab581c8462542f3",
"assets/lib/assets/data/job.json": "727eed8b39b5beba8e2ba41b7cfc058f",
"assets/lib/assets/data/projects.json": "2b6fd7dd4193244a22c58c9ff29e6bbc",
"assets/fonts/MaterialIcons-Regular.otf": "62ec8220af1fb03e1c20cfa38781e17e",
"assets/AssetManifest.json": "e94088d9b888310019cfd23250b78f74",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "71701d71dc759c6f38f4fab05dd806bf",
"assets/FontManifest.json": "8fa1b641afbb9ab9413a9545b59ab72c",
"assets/NOTICES": "02f5db701c53e2873483cffd4c6a52f3",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "429c04f3f6c5bea154b08c232a50dfa1",
"/": "429c04f3f6c5bea154b08c232a50dfa1",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/android-icon-192x192.png": "7c6386823ae4696f404a733edfa4efb2",
"icons/apple-icon-114x114.png": "3e921ec1440eddd95f9536e83d63e900",
"icons/apple-icon-76x76.png": "247ed23924c41c151c4979742a3a1ca4",
"icons/favicon-32x32.png": "056b7d8b1e291025bde83ba615bb03a4",
"icons/apple-icon-72x72.png": "08e01b3bc0d73fd99e0c80e3879a8ac0",
"icons/apple-icon-180x180.png": "e7e6314089c84e7b18fa0057d7b13b54",
"icons/android-icon-48x48.png": "ca128c155f55c18b45945b7a758d3c8e",
"icons/apple-icon.png": "ca6236ee154790a3fe172aa1d0c0703a",
"icons/apple-icon-57x57.png": "5eb1fe63571143a5908d2c604ae8f9ef",
"icons/favicon.ico": "abcadf22dc458ea477397ebe87b3d766",
"icons/ms-icon-310x310.png": "5d5f34d264936a216ada20c655d5985b",
"icons/manifest.json": "802260633735c38d63379a7ec759e40b",
"icons/favicon-96x96.png": "ac23a5f5fa93af9e1abd482148a78c2d",
"icons/android-icon-144x144.png": "6948469e0926890af8a74bb252e49881",
"icons/android-icon-36x36.png": "9ab9510bc36c000af4bdd965507d2cd6",
"icons/ms-icon-70x70.png": "3fbb5cafea498dd1d8ff16f8e2592209",
"icons/android-icon-96x96.png": "ac23a5f5fa93af9e1abd482148a78c2d",
"icons/android-icon-72x72.png": "08e01b3bc0d73fd99e0c80e3879a8ac0",
"icons/apple-icon-144x144.png": "6948469e0926890af8a74bb252e49881",
"icons/apple-icon-120x120.png": "acdcccaaa66cdc4221cfe62e8c01ab26",
"icons/ms-icon-150x150.png": "b892b172933f6e7a4d7edde6d4e3280c",
"icons/apple-icon-152x152.png": "7c19f7a98b0bfdc9427ba3b7e66ce162",
"icons/favicon-16x16.png": "616ad82e16a6c04f925c8a8756f419d3",
"icons/apple-icon-precomposed.png": "ca6236ee154790a3fe172aa1d0c0703a",
"icons/apple-icon-60x60.png": "b6bab2ecafd0e501686e7ca7f1c8f59f",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/ms-icon-144x144.png": "6948469e0926890af8a74bb252e49881",
"main.dart.js": "c8486f1ba084c455e1181aa61851daff",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
