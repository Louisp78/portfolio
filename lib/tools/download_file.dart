import 'dart:html' as html;

void downloadFile(String url) {
  html.AnchorElement anchorElement = new html.AnchorElement(href: url);
  anchorElement.download = url;
  anchorElement.click();
}
/*Future<void> downloadFile(String url) async =>
  await FlutterDownloader.enqueue(
    url: url,
    savedDir: 'downloads/',
    showNotification: true,
    // show download progress in status bar (for Android)
    openFileFromNotification: true, // click on notification to open downloaded file (for Android)
  );
*/