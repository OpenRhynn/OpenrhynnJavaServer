/*
MIT License
-----------

Copyright (c) 2019 Ivan Yurkov (MB "Stylo tymas" http://steel-team.net)
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
*/
package com.steelteam.openrhynn.network.handlers.server;

import com.steelteam.openrhynn.entities.Character;
import com.steelteam.openrhynn.network.ORClient;
import com.steelteam.openrhynn.network.messages.client.GameCharacterChatRequest;
import com.steelteam.openrhynn.network.messages.server.GameCharacterChatInfo;
import io.netty.channel.ChannelHandlerContext;

public class HandleGameCharacterChatRequest {
    public HandleGameCharacterChatRequest(ORClient client, ChannelHandlerContext ctx, GameCharacterChatRequest message) {
        /* try to get partner */
        /* validate parner type(for npc open dialog) */

        if(message.getPartnerId() > 200000) {
            //npc?
            return;
        } else if(message.getPartnerId() >= 100000) {
            //mob?
            return;
        }

        if(Character.characters.containsKey(message.getPartnerId())) {
            Character ch = Character.characters.get(message.getPartnerId());
            if(!ch.dead)
                ch.connectedClient.writeMessage(new GameCharacterChatInfo(client.currentChar.objectId, client.currentChar.name, message.getMsg()).getData());
        } else {
            //offline info
        }
    }
}
