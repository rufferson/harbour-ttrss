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
getHeadlines(feed_id:-3): fresh
{"seq":0,"status":0,"content":[
    {"id":11751,"unread":true,"marked":false,"published":false,"updated":1388923626,"is_updated":false,"title":"Parted Magic Continues Being Commercial-Only","link":"http:\/\/feedproxy.google.com\/~r\/Phoronix\/~3\/CBir-qJXI-M\/vr.php","feed_id":"16","tags":[""],"labels":null,"feed_title":"Phoronix","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0},
    {"id":11750,"unread":true,"marked":false,"published":false,"updated":1388924160,"is_updated":false,"title":"Corning: Gebogenes Gorilla-Glas f\u00fcr Smartphones und Smartwatches","link":"http:\/\/rss.feedsportal.com\/c\/33374\/f\/578068\/p\/1\/s\/320753ca\/l\/0L0Sgolem0Bde0Cnews0Ccorning0Egebogenes0Egorilla0Eglas0Efuer0Esmartphones0Eund0Esmartwatches0E140A10E10A36980Erss0Bhtml\/story01.htm","feed_id":"22","tags":[""],"labels":[],"feed_title":"Golem.de","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0},
    {"id":11749,"unread":true,"marked":false,"published":false,"updated":1388917555,"is_updated":false,"title":"Ubuntu's Mir Gets A Compositor Report","link":"http:\/\/feedproxy.google.com\/~r\/Phoronix\/~3\/u_nbmB93BvA\/vr.php","feed_id":"16","tags":[""],"labels":[],"feed_title":"Phoronix","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0},
    {"id":11748,"unread":true,"marked":false,"published":false,"updated":1388912529,"is_updated":false,"title":"Latest Trolling? The Linux Kernel In Perl","link":"http:\/\/feedproxy.google.com\/~r\/Phoronix\/~3\/9ou0XbnAxwA\/vr.php","feed_id":"16","tags":[""],"labels":[],"feed_title":"Phoronix","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0},
    {"id":11747,"unread":true,"marked":false,"published":false,"updated":1388911800,"is_updated":false,"title":"Netzpolitik: Europas neue Gurken","link":"http:\/\/rss.feedsportal.com\/c\/33374\/f\/578068\/p\/1\/s\/40761420\/l\/0L0Sgolem0Bde0Cnews0Cnetzpolitik0Eeuropas0Eneue0Egurken0E140A10E10A35570Erss0Bhtml\/story01.htm","feed_id":"22","tags":[""],"labels":[],"feed_title":"Golem.de","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0},
    {"id":11746,"unread":true,"marked":false,"published":false,"updated":1388901326,"is_updated":false,"title":"Linux 3.13-rc7 Kernel Is A Light Release","link":"http:\/\/feedproxy.google.com\/~r\/Phoronix\/~3\/10r6BE3aiUY\/vr.php","feed_id":"16","tags":[""],"labels":[],"feed_title":"Phoronix","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0},
    {"id":11745,"unread":true,"marked":false,"published":false,"updated":1388898687,"is_updated":false,"title":"G.SKILL 8GB DDR3 Laptop Memory On A Linux Ultrabook","link":"http:\/\/feedproxy.google.com\/~r\/Phoronix\/~3\/IF-f6zr4N9g\/vr.php","feed_id":"16","tags":[""],"labels":[],"feed_title":"Phoronix","comments_count":0,"comments_link":"","always_display_attachments":false,"author":"","score":0}
]}
{
    "id":14205,
    "unread":true,
    "marked":false,
    "published":false,
    "updated":1392513240,
    "is_updated":false,
    "title":"Microsoft: Windows Phone 8.1 mit zahlreichen neuen Features",
    "link":"http:\/\/www.notebookcheck.com\/Microsoft-Windows-Phone-8-1-mit-zahlreichen-neuen-Features.111660.0.html",
    "feed_id":"23",
    "tags":["news"],
    "excerpt":"App-Entwickler haben eine gro\u00dfe Liste an neuen Features von Windows Phone 8.1 bekanntgegeben. Die Li&hellip;",
    "labels":null,
    "feed_title":"Notebookcheck.com: News RSS Feed",
    "comments_count":0,
    "comments_link":"",
    "always_display_attachments":false,
    "author":"",
    "score":0
}
{
    "id":14165,
    "unread":true,
    "marked":false,
    "published":false,
    "updated":1392389100,
    "is_updated":false,
    "title":"\u041f\u043e\u0447\u0435\u043c\u0443 Respawn \u0443\u0432\u0435\u0440\u0435\u043d\u0430 \u0432 \u0443\u0441\u043f\u0435\u0445\u0435 Titanfall",
    "link":"http:\/\/compulenta.computerra.ru\/tehnika\/security\/10011511\/",
    "feed_id":"26",
    "tags":["\u0442\u0435\u0445\u043d\u0438\u043a\u0430 \u0438 \u0442\u0435\u0445\u043d\u043e\u043b\u043e\u0433\u0438\u0438 \/ \u043f\u043e \u0438 \u0431\u0435\u0437\u043e\u043f\u0430\u0441\u043d\u043e\u0441\u0442\u044c"],
    "excerpt":"\u0428\u0435\u0441\u0442\u044c \u043d\u0430 \u0448\u0435\u0441\u0442\u044c \u2014 \u044d\u0442\u043e\u0433\u043e \u0432\u043f\u043e\u043b\u043d\u0435 \u0434\u043e\u0441\u0442\u0430\u0442\u043e\u0447\u043d\u043e \u0434\u043b\u044f \u043e\u0442\u043c\u0435\u043d\u043d\u043e\u0433\u043e \u0441\u0440\u0430\u0436\u0435\u043d\u0438\u044f. \u0417\u0430\u044f\u0432\u043b\u0435\u043d\u0438\u0435 Respawn \u043e \u0442\u043e\u043c, \u0447\u0442\u043e \u0438\u0433\u0440\u0430\u0442\u044c&hellip;",
    "labels":[],
    "feed_title":"\u041a\u043e\u043c\u043f\u044c\u044e\u043b\u0435\u043d\u0442\u0430",
    "comments_count":0,
    "comments_link":"",
    "always_display_attachments":false,
    "author":"",
    "score":0
}
{
    "id":12863,
    "unread":true,
    "marked":false,
    "published":false,
    "updated":1390507260,
    "is_updated":false,
    "title":"\n\t\t\n\t\tNASA's Opportunity at 10: New Findings from Old Rover\n\t\t\n\t",
    "link":"\n \t\t\n \t\thttp:\/\/www.jpl.nasa.gov\/news\/news.cfm?release=2014-022&rn=news.xml&rst=4021\n \t\t\n\t",
    "feed_id":"17",
    "tags":["science"],
    "excerpt":"\n\t\t\n\t\t\n\t\t\n\t\tA decade into a mission planned for only three months, NASA's Mars Exploration Rover Opp&hellip;",
    "labels":[],
    "feed_title":"News and Features - NASA's Jet Propulsion Laboratory",
    "comments_count":0,
    "comments_link":"",
    "always_display_attachments":false,
    "author":"",
    "score":0
}
*/

Page {
    id: pgHeadlines
    property ListModel lmParent
    property int idItem
    property string title: (lmParent===null)?'Special':lmParent.get(idItem).title
    property int unread: (lmParent===null)?ttRSS.unread:lmParent.get(idItem).unread
    property int fid: (lmParent===null)?idItem:lmParent.get(idItem).id
    property bool reverse: false
    property int pos: 0
    property string css: "<style>a{color:"+Theme.secondaryHighlightColor+"}</style>"

    SilicaListView {
        id: lvArticles
        model: lmHeadline
        anchors.fill: parent
        header: PageHeader {
            title: pgHeadlines.title+' ('+pgHeadlines.unread+')'
        }
        PullDownMenu {
            MenuItem{
                text: "Rewind"
                onClicked: {pos-=lmHeadline.count;getArticles(0)}
            }
            MenuItem {
                text: "Reverse"
                font.bold: reverse
                onClicked: {reverse=!reverse;getArticles(0)}
            }
            MenuItem{
                text: "Skip ("+pos+")"
                onClicked: {pos+=lmHeadline.count;getArticles(0)}
            }
        }
        delegate: ListItem {
            id: liHeadline
            width: parent.width
            contentHeight: contentItem.childrenRect.height
            menu: ContextMenu {
                id: ctxMenu
                closeOnActivation: true
                MenuItem {
                    text: "Set Unread"
                    onClicked: liHeadline.setUnRead(model.id,index)
                }
            }
            Label {
                id: title
                anchors.top: parent.top
                width: parent.width
                text: model.title
                textFormat: Text.RichText
                font.pixelSize: ttRSS.txsz+4//Theme.fontSizeSmall
                font.bold: model.unread
            }
            Label {
                id: excerpt
                text: model.excerpt
                anchors.top: title.bottom
                width: parent.width
                textFormat: Text.RichText
                baseUrl: model.link
                wrapMode: Text.WordWrap
                font.pixelSize: ttRSS.txsz//Theme.fontSizeTiny
                font.bold: model.unread
            }
            Label {
                id: article
                width: parent.width
                anchors.top: excerpt.bottom
                text: ""
                baseUrl: model.link
                textFormat: Text.RichText
                linkColor: Theme.secondaryHighlightColor
                font.pixelSize: ttRSS.txsz//Theme.fontSizeTiny
                font.bold: true//model.unread
                wrapMode: Text.WordWrap
                height: 1
                opacity: 0//(height>1)?1:0
            }
            Button {
                id: btnLink
                text: 'Open Original Article'
                width: parent.width
                anchors.top: article.bottom
                height: 1
                opacity: 0//(height>1)?1:0
                onClicked: pageStack.push(Qt.resolvedUrl("Article.qml"),{hdr:model})
                preventStealing: true
            }
            Label {
                id: footer
                width: parent.width
                anchors.top: article.bottom
                text: "Date: "+new Date(model.updated*1000)
                font.pixelSize: Theme.fontSizeTiny
            }
            Separator {
                anchors.top: footer.bottom
                width: parent.width
                height: 3
                color: highlighted ? Theme.highlightColor : Theme.secondaryHighlightColor
            }
            states: State {
                name: "full"
                PropertyChanges { target: excerpt; height: 1; opacity:0 }
                PropertyChanges { target: article; height: article.contentHeight; opacity:1 }
                PropertyChanges { target: btnLink; height: 50;opacity:1 }
                PropertyChanges { target: title;   wrapMode: Text.WordWrap }
                PropertyChanges { target: footer;  anchors.top: btnLink.bottom }
            }
            transitions: Transition {
                ParallelAnimation {
                    NumberAnimation { duration: 600; properties: "opacity,contentY,height,top" }
                }
            }

            onClicked: getArticle(index)
            onHighlightedChanged: reset(index)
            function reset(index) {
                if(lvArticles.currentIndex!==index)
                    lvArticles.currentItem.state="";
            }
            /*
Results:  [<img src="http://www.golem.de/1401/104201-72320-i_rc.jpg",http://www.golem.de/1401/104201-72320-i_rc.jpg]
              */
            function getArticle(index) {
                lvArticles.currentIndex=index;
                var data = {
                    op: "getArticle",
                    article_id: model.id
                };
                remote_call(data,
                    function(ret) {
                        console.log("Ready");
                        var re=new RegExp("(?:<[iI][mM][gG].+?[sS][rR][cC]=[\"'])([^\"']+)(?:[\"'])",'g');
                        for(var artn in ret.content) {
                            console.log("Steady",artn);
                            var txt=ret.content[artn].content.trim();
                            /* Has no sense for light version
                            if(ttRSS.dlim) {
                                var ar=re.exec(txt);
                                while(ar) {
                                    console.log("Results: ",ar);
                                    if (ar[1].startswith('http')) {
                                        //
                                    }
                                    ar=re.exec(txt)
                                }
                            }*/
                            article.text=css+txt;
                            liHeadline.state="full";
                            if(model.unread)
                                setRead(model.id,index);
                        }
                    },
                    function(){}
                );
            }
            function setRead(article_id,index) {
                if(!unread) return;
                var data = {
                    op: "updateArticle",
                    article_ids: article_id,
                    mode:0,
                    field:2
                };
                remote_call(data,function(ret) {
                    if(typeof index === 'number') {
                        lmHeadline.setProperty(index,'unread',false);
                        lmParent.setProperty(idItem,'unread',(pgHeadlines.unread-1));
                        console.log("Unread left: ",pgHeadlines.unread);
                    }
                });
            }
            function setUnRead(article_id,index) {
                if(unread) return;
                var data = {
                    op: "updateArticle",
                    article_ids: article_id,
                    mode:1,
                    field:2
                };
                remote_call(data,function(ret) {
                    if(typeof index === 'number') {
                        liHeadline.state="";
                        lmHeadline.setProperty(index,'unread',true);
                        lmParent.setProperty(idItem,'unread',(pgHeadlines.unread+1));
                        console.log("Unread left: ",pgHeadlines.unread);
                    }
                });
            }
            function removeArticleLabels(article_id) {
                var labels = "";
                var data = {
                    op: "getLabels",
                    article_id: article_id
                };
                remote_call(data, function(ret) {
                        for(var label in data.content) {
                            removeLabel(url, context, article_id, label.id);
                        }
                    },
                    function(){}
                );
            }
        }
        VerticalScrollDecorator {flickable: lvArticles}
        onMovementEnded: {
            if(atYEnd)
                getArticles(lmHeadline.count);
        }
    }
    ListModel {
        id: lmHeadline
    }
    Component.onCompleted: getArticles(0)
    function getArticles(skip) {
        var v_mode = "";
        var v_sort = "";
        if (unread>0) {
            v_mode="unread";
            if(unread>50) {
                v_sort="date_reverse";
                if(lvArticles.atYEnd) {
                    skip=0;
                    lvArticles.scrollToTop();
                }
            }
        } else {
            v_mode="all_articles";
        }
        if(reverse) {
            if(v_sort==="")
                v_sort="date_reverse";
            else
                v_sort="";
        }
        if(pos<0)
            pos=0;
        var data = {
            op: "getHeadlines",
            feed_id: fid,
            is_cat:false,
            show_excerpt:true,
            show_content:false,
            view_mode: v_mode,
            include_attachments:false,
            since_id:0,
            limit: 50,
            skip: pos+skip,
            include_nested: false,
            order_by: v_sort
        };
        ttRSS.remote_call(data,
            function(ret) {
                if(skip===0)
                    lmHeadline.clear();
                for(var hdi in ret.content) {
                    console.log('Adding',hdi);
                    lmHeadline.append(ret.content[hdi]);
                }
            }
        );
    }
}
