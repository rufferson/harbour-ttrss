/*
  Copyright (C) 2015 Ruslan N. Marchenko
  Contact: me@ruff.mobi
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


Page {
    id: page
    allowedOrientations: ttRSS.allowedOrientations//Orientation.Portrait | Orientation.Landscape//Orientation.All

    SilicaListView {
        id: lvCategories
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Settings"
                onClicked: ttRSS.getSettings();
            }
            MenuItem {
                text: "Refresh"
                onClicked: getCategories()
            }
        }
        header: PageHeader {
            width: parent.width
            //height: 42
            title: "TT-RSS: "+ttRSS.feeds+' feeds'
            description: ((ttRSS.isup)?" ":" not ")+'updating '
        }
        ViewPlaceholder {
            enabled: lvCategories.count == 0
            text: "No Data"
            hintText: "Pull-down and Refresh to get data"
        }
        footer: Column {
            width: parent.width
            enabled: lvCategories.count > 0
            visible: enabled
            Label {
                width: parent.width
                text: 'Specials: breakdown'
                font.pixelSize: ttRSS.txsz+12
                font.family: Theme.fontFamilyHeading
                //font.bold: true
            }
            Separator {
                width: parent.width
                height: 3
                color: Theme.secondaryHighlightColor
            }
            ListItem {
                contentHeight: ttRSS.txsz*2+8
                Label {
                    anchors.fill: parent
                    text: "(-) All Articles"
                    font.pixelSize: ttRSS.txsz+8
                }
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-4})
            }
            ListItem {
                contentHeight: ttRSS.txsz*2+8
                Label {
                    anchors.fill: parent
                    text: "(-) All Unread"
                    font.pixelSize: ttRSS.txsz+8
                }
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-3})
            }
            ListItem {
                contentHeight: ttRSS.txsz*2+8
                Label {
                    anchors.fill: parent
                    text: "(-) Published"
                    font.pixelSize: ttRSS.txsz+8
                }
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-2})
            }
            ListItem {
                contentHeight: ttRSS.txsz*2+8
                Label {
                    anchors.fill: parent
                    text: "(-) All Starred"
                    font.pixelSize: ttRSS.txsz+8
                }
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-1})
            }
            ListItem {
                contentHeight: ttRSS.txsz*2+8
                Label {
                    anchors.fill: parent
                    text: "(-) Archived"
                    font.pixelSize: ttRSS.txsz+8
                }
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:0})
            }
        }

        VerticalScrollDecorator {}
        model: lmCategories
        delegate: Category { cat: model }
    }
    ListModel {
        id: lmCategories
    }
    //Component.onCompleted:ttRSS.loadSettings(getCategories)
    onStatusChanged: {
        if(status===PageStatus.Activating)
            getCategories(true)
        else if(status===PageStatus.Active && lmCategories.count==0)
            ttRSS.loadSettings(getCategories)
    }

    function updateCategory(cat) {
        for(var i=0;i<lmCategories.count;i++) {
            var li=lmCategories.get(i);
            if(li.id===cat.id) {
                console.log('Found category ',cat.id,', updating');
                if(li.title!==cat.title)
                    lmCategories.setProperty(i,'title',cat.title);
                if(li.unread!==cat.unread)
                    lmCategories.setProperty(i,'unread',cat.unread);
                return;
            }
        }
        console.log("Found new category: ",cat.title);
        lmCategories.append(cat);
    }

    function getCategories(soft) {
        if(soft && lmCategories.count==0)
            return;
        var data = {
            op: "getCategories",
            unread_only:false
        };
        ttRSS.remote_call(data,
            function(ret) {
                if(!soft)
                    lmCategories.clear();
                for(var cat in ret.content) {
                    console.log('Adding LM: ',ret.content[cat])
                    if(typeof ret.content[cat].id==='string')
                        ret.content[cat].id=parseInt(ret.content[cat].id);
                    if(typeof ret.content[cat].unread==='string')
                        ret.content[cat].unread=parseInt(ret.content[cat].unread);
                    if(soft) {
                        updateCategory(ret.content[cat]);
                    } else {
                        if(ret.content[cat].id>=0)
                            lmCategories.append(ret.content[cat]);
                        else
                            lmCategories.insert(0,ret.content[cat])
                    }
                }
            }
        );
    }
/*
    function getLabels(context) {
        var data = {
            op: "getLabels",
        };
        ttRSS.remote_call(data,function(ret){context.labels= ret.content;},function(){});
    }
*/
}
