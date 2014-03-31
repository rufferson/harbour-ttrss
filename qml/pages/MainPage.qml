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


Page {
    id: page

    SilicaListView {
        id: lvCategories
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Settings"
                onClicked: ttRSS.getSettings();
            }

            MenuItem {
                text: "All Articles"
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-4})
            }
            MenuItem {
                text: "All Unread"
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-3})
            }
            MenuItem {
                text: "All Starred"
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-1})
            }
        }
        PushUpMenu {
            MenuItem {
                text: "Refresh"
                onClicked: getCategories()
            }
            MenuItem {
                text: "Published"
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:-2})
            }
            MenuItem {
                text: "Archived"
                onClicked: pageStack.push(Qt.resolvedUrl("Headline.qml"),{idItem:0})
            }
        }
        PageHeader {
            title: "TT RSS Light "
        }
        ViewPlaceholder {
            enabled: lvCategories.count == 0
            text: "No Data"
            hintText: "Pull-up Refresh to get data"
        }
        VerticalScrollDecorator {}
        model: lmCategories
        delegate: Category { cat: model }
    }
    ListModel {
        id: lmCategories
    }
    Component.onCompleted:ttRSS.loadSettings()//;getCategories()}
    onStatusChanged: {if(status===PageStatus.Activating)getCategories(true)}

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
        var data = {
            op: "getCategories",
            unread_only:false
        };
        ttRSS.remote_call(data,
            function(ret) {
                if(soft!==true)
                    lmCategories.clear();
                else if(lmCategories.count<1)
                    soft=false;
                for(var cat in ret.content) {
                    console.log('Adding LM: ',ret.content[cat])
                    if(typeof ret.content[cat].id==='string')
                        ret.content[cat].id=parseInt(ret.content[cat].id);
                    if(typeof ret.content[cat].unread==='string')
                        ret.content[cat].unread=parseInt(ret.content[cat].unread);
                    if(soft===true) {
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
