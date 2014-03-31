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
import QtQuick.LocalStorage 2.0 as Sql
import "pages"

ApplicationWindow
{
    id: ttRSS
    initialPage: Qt.resolvedUrl("pages/MainPage.qml")
    cover: Qt.resolvedUrl("cover/CoverPage.qml")

    property string url: 'https://www.example.com/tt-rss'
    property string sid: ''
    property string user: ''
    property string pass: ''
    property bool dlim: false
    property bool svpw: false
    property int txsz: Theme.fontSizeTiny
    property int feeds
    property bool isup
    property var db

    function initDb() {
        ttRSS.db = Sql.LocalStorage.openDatabaseSync("TTRSS", "1.0", "Saved state for TT-RSS", 1000);
        ttRSS.db.transaction(function(tx) {
            var res=tx.executeSql('CREATE TABLE IF NOT EXISTS settings(setting TEXT UNIQUE, value TEXT)');
            console.log("Created TTRSS DB: ",res);
        });
    }
    function loadSettings() {
        initDb();
        ttRSS.url=dbGet('url',ttRSS.url);
        ttRSS.sid=dbGet('sid',ttRSS.sid);
        ttRSS.user=dbGet('user',ttRSS.user);
        ttRSS.pass=dbGet('pass',ttRSS.pass);
        ttRSS.dlim=dbGet('dlim',ttRSS.dlim);
        ttRSS.txsz=dbGet('txsz',ttRSS.txsz);
        console.log("Font size ",Theme.fontSizeTiny,' ',Theme.fontSizeExtraSmall, " ", Theme.fontSizeSmall);
        console.log("Font color ",Theme.primaryColor, " ", Theme.highlightColor);
        if(ttRSS.pass!=='')
            ttRSS.svpw=true;
        getConfig();
    }
    function storeSettings() {
        dbSet('url',ttRSS.url);
        dbSet('user',ttRSS.user);
        dbSet('dlim',ttRSS.dlim);
        dbSet('txsz',ttRSS.txsz);
        if (ttRSS.svpw)
            dbSet('pass',ttRSS.pass);
    }
    function dbSet(setting, value) {
       var success = false;
       console.log("setting DB "+setting+" to "+value);
       ttRSS.db.transaction(function(tx) {
            var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [setting,value]);
                  //console.log(rs.rowsAffected)
                  if (rs.rowsAffected > 0) {
                    success = true;
                  }
            }
      );
      return success;
    }
    function dbGet(setting, defaultValue) {
       var result = defaultValue;
       console.log("getting DB "+setting+" with "+defaultValue);
       ttRSS.db.transaction(function(tx) {
         var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
         if (rs.rows.length > 0) {
              result = rs.rows.item(0).value;
         }
      });
      return result;
    }
    function showAlert (message, title) {
        pageStack.push(Qt.resolvedUrl("pages/Alert.qml"),{message:message,title:title+' Error'});
    }
    function getSettings(proceed) {
        console.log("Reconfiguring: ",proceed);
        while(pageStack.busy) {console.log('Waiting...')}
        var dialog = pageStack.push(Qt.resolvedUrl("pages/Settings.qml"),
                                    {url:ttRSS.url,user:ttRSS.user,pass:ttRSS.pass,txsz:ttRSS.txsz,dlim:ttRSS.dlim},
                                    PageStackAction.Immediate);
        console.log('Waiting for action: ',dialog);
        dialog.accepted.connect(function(){
            ttRSS.url=dialog.url;
            ttRSS.user=dialog.user;
            ttRSS.pass=dialog.pass;
            ttRSS.svpw=dialog.svpw;
            ttRSS.dlim=dialog.dlim;
            ttRSS.txsz=dialog.txsz;
            storeSettings();
            if (proceed !== undefined)
                proceed();
        });
    }

    function remote_call(data, success, error) {
        var url = ttRSS.url;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", url + "/api/");
        xhr.onreadystatechange = function() {
            if(xhr.readyState === xhr.DONE) {
                if(xhr.status === 200) {
                    console.log(xhr.responseText);
                    var json = eval('('+xhr.responseText+')');
                    console.log(json,success,error);
                    if (json.status === 1) {
                        if (json.content.error==="NOT_LOGGED_IN") {
                            if(ttRSS.sid !== "" || ttRSS.pass === '') {
                                getSettings(function(){
                                    login(function() {remote_call(data,success,error)});
                                });
                            } else if(ttRSS.sid === '') {
                                ttRSS.sid='invalid';
                                login(function() {remote_call(data,success,error)});
                            }
                        } else if (url != "" && url !=  undefined)
                            showAlert("Error:" + json.content.error, "TTRSS");
                    } else {
                        if(success !== undefined)
                            success(json);
                    }
                } else {
                    if (url != "" && url != undefined)  {
                        showAlert("Host unreachable:" + url + "\nPlease Check Network","TTRSS");
                    } else {
                        if(error !== undefined)
                            error(json);
                        else
                            showAlert("Network Error, Please Check Network","TTRSS");
                    }

                }
            }
        };
        if(data.op !== 'login') {
            if(ttRSS.sid!='')
                data.sid = ttRSS.sid;
            else if(ttRSS.user=='' && ttRSS.pass=='')
                getSettings(login(function(){data.sid=ttRSS.sid}))
        }
        xhr.send(JSON.stringify(data));
    }
    function login(ok) {
        ttRSS.sid='';
        var data = {
            op: 'login',
            user: ttRSS.user,
            password: ttRSS.pass
        };
        console.log('logging in: ',ttRSS.user)
        remote_call(data,
            function(ret){
                ttRSS.sid=ret.content.session_id;
                dbSet('sid',ttRSS.sid);
                if (ok != undefined)
                    ok();
            },
            getSettings);
    }
    function getConfig() {
        var data = {
            op: "getConfig",
        };
        ttRSS.remote_call(data,
            function(ret){
                ttRSS.feeds=ret.content.num_feeds;
                ttRSS.isup=ret.content.daemon_is_running;
            },function(){});
    }
}

/*
function setLabel(url, context, article_id, label_id) {
    var data = {
        op: "setArticleLabel",
        sid: context.session_id,
        article_ids: article_id,
        label_id: label_id,
        assign:true,
        mode:0,
        field:2
    6440};6440
    remote_call(url,data);
}

function removeLabel(url, context, article_id, label_id) {
    var data = {
        op: "setArticleLabel",
        sid: context.session_id,
        article_ids: article_id,
        label_id: label_id,
        assign:false,
        mode:0,
        field:2
    };
    remote_call(url,data);
}


function addStar(url, context, article_id) {
    var data = {
        op: "updateArticle",
        sid: context.session_id,
        article_ids: article_id,
        mode:1,
        field:0
    };
    remote_call(url,data);
}

function subscribe(url, context, feedurl, categoryID) {
    var data = {
        op: "subscribeToFeed",
        sid: context.session_id,
        feed_url: feedurl,
        category_id:categoryID
    };
    remote_call(url,data,
          function(ret)
          {
              context.subscribe(feedurl,ret.content.status);
          }
    );
}

function unSubscribe(url, context, feed_id) {
    var data = {
        op: "unsubscribeFeed",
        sid: context.session_id,
        feed_id: feed_id
    };
    remote_call(url, data,
          function(ret)
          {
              context.unsubscribe(feed_id,ret.content.status);
          }
    );
}
            function serialize(object, maxDepth) {
                function _processObject(object, maxDepth, level) {
                    var output = Array()
                    var pad = " "
                    if (maxDepth == undefined) {
                        maxDepth = -1
                    }
                    if (level == undefined) {
                        level = 0
                    }
                    var padding = Array(level + 1).join(pad)

                    output.push((Array.isArray(object) ? "[" : "{"))
                    var fields = Array()
                    for (var key in object) {
                        var keyText = Array.isArray(object) ? "" : ("\"" + key + "\": ")
                        if (typeof (object[key]) == "object" && key != "parent" && maxDepth != 0) {
                            var res = _processObject(object[key], maxDepth > 0 ? maxDepth - 1 : -1, level + 1)
                            fields.push(padding + pad + keyText + res)
                        } else {
                            fields.push(padding + pad + keyText + "\"" + object[key] + "\"")
                        }
                    }
                    output.push(fields.join(",\n"))
                    output.push(padding + (Array.isArray(object) ? "]" : "}"))

                    return output.join("\n")
                }

                return _processObject(object, maxDepth)
            }

*/
