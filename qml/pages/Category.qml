import QtQuick 2.2
import Sailfish.Silica 1.0

/*
getCategories():
{"seq":0,"status":0,"content":[
    {"id":"4","title":"Linux","unread":4,"order_id":0},
    {"id":"5","title":"Wissenschaft","unread":0,"order_id":0},
    {"id":"6","title":"Technology","unread":2,"order_id":0},
    {"id":-2,"title":"Labels","unread":"0"},
    {"id":-1,"title":"Special","unread":6},
    {"id":0,"title":"Uncategorized","unread":0}
]}
getFeeds(): ~= getFeeds(cat_id:0)
{"seq":0,"status":0,"content":[
    {"feed_url":"http:\/\/www.jpl.nasa.gov\/multimedia\/rss\/news.xml","title":"News and Features - NASA's Jet Propulsion Laboratory","id":17,"unread":0,"has_icon":true,"cat_id":0,"last_updated":1388925588,"order_id":0},
    {"feed_url":"https:\/\/forum.openwrt.org\/extern.php?action=feed&tid=4427&type=rss","title":"OpenWrt \u2014 Disable DHCP on WRT54G","id":27,"unread":0,"has_icon":true,"cat_id":0,"last_updated":1388925586,"order_id":0},
    {"feed_url":"http:\/\/tt-rss.org\/releases.rss","title":"Tiny Tiny RSS: New Releases","id":14,"unread":0,"has_icon":true,"cat_id":0,"last_updated":1388925593,"order_id":0}
]}
getFeeds(cat_id:4):
{"seq":0,"status":0,"content":[
    {
        "feed_url":"http:\/\/feeds.feedburner.com\/Phoronix",
        "title":"Phoronix",
        "id":16,
        "unread":5,
        "has_icon":true,
        "cat_id":4,
        "last_updated":1388925974,
        "order_id":0}
]}
*/


Column {
    id: liCategory
    property var cat
    height: ttRSS.txsz*2 + lvFeeds.height + 4
    spacing: 5
    width: parent.width
    Row {
        width: parent.width
        Label {
            text: cat.title
            width: parent.width-70
            font.bold: cat.unread > 0
            font.pixelSize: ttRSS.txsz+12
            font.family: Theme.fontFamilyHeading
        }
        Label {
            text: cat.unread
            width: 70
            horizontalAlignment: Text.AlignRight
            font.bold: cat.unread > 0
            font.pixelSize: ttRSS.txsz+12
        }
    }
    Separator {
        enabled: cat.id >= 0
        visible: enabled
        width: parent.width
        height: 3
        color: Theme.secondaryHighlightColor
    }
    SilicaListView {
        id: lvFeeds
        width: parent.width
        height: contentItem.childrenRect.height
        delegate: ListItem {
            contentHeight: ttRSS.txsz*2+8
            Label {
                anchors.fill: parent
                text: '('+model.unread+') '+model.title
                font.pixelSize: ttRSS.txsz+8
                font.bold: model.unread > 0
            }
            onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:index,lmParent:lmFeeds});
            function setAllRead() {
                var data = {
                    op: "catchupFeed",
                    feed_id: model.id,
                };
                remote_call(data, function(ret) {
                    lmFeeds.setProperty(index,'unread',0);
                });
            }
            function unsubscribe(){
                var data = {
                    op: "unsubscribeFeed",
                    feed_id: model.id,
                };
                remote_call(data, function(ret) {
                    //lmFeeds.setProperty(index,'unread',0);
                });
            }

            menu: ContextMenu {
                id: ctxMenu
                closeOnActivation: true
                MenuItem {
                    text: "Set All Read"
                    onClicked: setAllRead()
                }
                MenuItem {
                    text: "Unsubscribe Feed"
                    onClicked: unsubscribe()
                }
            }
        }
        model: ListModel {
            id: lmFeeds
        }
        function updateFeed(feed) {
            for(var i=0;i<lmFeeds.count;i++) {
                var li=lmFeeds.get(i);
                if(li.id===feed.id) {
                    console.log('Found feed ',li.id,', updating');
                    if(li.title!==feed.title)
                        lmFeeds.setProperty(i,'title',feed.title);
                    if(li.unread!==feed.unread)
                        lmFeeds.setProperty(i,'unread',feed.unread);
                    if(li.feed_url!==feed.feed_url)
                        lmFeeds.setProperty(i,'feed_url',feed.feed_url);
                    if(li.last_updated!==feed.last_updated)
                        lmFeeds.setProperty(i,'last_updated',feed.last_updated)
                    return;
                }
            }
            console.log("Found new feed: ",feed.title);
            lmFeeds.append(feed);
        }
        function getFeeds(soft) {
            if(liCategory.cat.id<0 || lmFeeds==undefined)
                return;
            var data = {
                op: "getFeeds",
                cat_id: liCategory.cat.id,
                unread_only: false,
                limit: 0,
                offset: 0,
                include_nested: false
            };

            ttRSS.remote_call(data,
                function(ret) {
                    if(soft!==true)
                        lmFeeds.clear();
                    else if(lmFeeds.count<1)
                        soft=false;
                    for(var cat in ret.content) {
                        if(soft===true)
                            updateFeed(ret.content[cat])
                        else
                            lmFeeds.append(ret.content[cat])
                    }
                }
            );
        }
    }
    onCatChanged: lvFeeds.getFeeds(true)
}
