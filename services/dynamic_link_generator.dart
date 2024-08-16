import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkGenerator{

  DynamicLinkGenerator._();
  static DynamicLinkGenerator? _instance;

  static DynamicLinkGenerator? get instance {
    _instance ??= DynamicLinkGenerator._();
    return _instance;
  }


  final dynamicLink = FirebaseDynamicLinks.instance;

  Future<void> createReferLink(String referCode) async {
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      uriPrefix: 'https://inviteandearn.page.link',
      link: Uri.parse('https://inviteandearn.page.link/refer?code=$referCode'),
      androidParameters: const AndroidParameters(
        packageName: 'com.example.invite_earn',
        minimumVersion: 1,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'REFER A FRIEND & EARN',
        description: 'Refer a friend to earn free rewards',
        imageUrl: Uri.parse('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.shutterstock.com%2Fsearch%2Finvite-earn&psig=AOvVaw2VHjYIXuJuMz75TfY4h7YD&ust=1723564365704000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKD4hODn74cDFQAAAAAdAAAAABAE'),
      ),
    );

    final shortLink = await dynamicLink.buildShortLink(dynamicLinkParameters);

    print(shortLink.shortUrl.toString());

    //return shortLink.shortUrl.toString();
  }

}