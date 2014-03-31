/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

/*
{"seq":0,"status":0,"content":[
    {
        "id":"14187",
        "title":"\n\t\t\n\t\tResponding to Potential Asteroid Redirect Mission Targets\n\t\t\n\t",
        "link":"\n \t\t\n \t\thttp:\/\/www.jpl.nasa.gov\/news\/news.cfm?release=2014-052&rn=news.xml&rst=4050\n \t\t\n\t",
        "labels":[],
        "unread":true,
        "marked":false,
        "published":false,
        "comments":"",
        "author":"",
        "updated":1392408120,
        "content":"\n\t\t\n\t\t<p><a href=\"http:\/\/www.jpl.nasa.gov\/news\/news.cfm?release=2014-052&rn=news.xml&rst=4050\">\n\t\t<img src=\"http:\/\/www.jpl.nasa.gov\/images\/asteroid\/20140214\/asteroid20140214-226.jpg\" align=\"left\" alt=\"Concept image shows an astronaut preparing to take samples from the captured asteroid\" width=\"100\" height=\"75\" border=\"0\" \/><\/a><br \/><br \/>\n\t\tNASA is pursuing new partnerships and collaborations to accelerate existing work to find near-Earth asteroids and know what to do about them. \n\t\t<\/p><br clear=\"all\"\/><br \/>\n\t\t\n\t",
        "feed_id":"17",
        "attachments":[],
        "score":0,
        "feed_title":"News and Features - NASA's Jet Propulsion Laboratory"
    }
]}
*/
Page {
    id: pgArticle
    property var hdr
    SilicaWebView {
        id: wvArticle
        anchors.fill: parent
        url: hdr.link
        PullDownMenu {
            MenuItem {
                text: "Forward"
                onClicked: wvArticle.forward()
            }
            MenuItem {
                text: "Refresh"
                onClicked: wvArticle.reload()
            }
            MenuItem {
                text: "Back"
                onClicked: wvArticle.back()
            }
        }
    }
}
