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
package com.steelteam.openrhynn.network.messages.server;

import com.steelteam.openrhynn.network.messages.ORMessageIDs;
import com.steelteam.openrhynn.network.messages.ORMessage;

public class GameCharacterHitInfo {

    private ORMessage _message = null;

    /* custom start */
    private int _attackerId = 0;
    private int _targetId = 0;
    private int _hitValue = 0;
    private int _currentHealth = 0;
    /* custom end */

    public GameCharacterHitInfo(int attackerId, int targetId, int hitValue, int currentHealth) {
        _message = new ORMessage(getMessageId());
        /* custom start */
        _attackerId = attackerId;
        _targetId = targetId;
        _hitValue = hitValue;
        _currentHealth = currentHealth;

        _message.writeInt4(_attackerId);
        _message.writeInt4(_targetId);
        _message.writeInt2(_hitValue);
        _message.writeInt2(_currentHealth);

        /* custom end */
    }

    public GameCharacterHitInfo(ORMessage message) {
        _message = message;
        /* custom start */
        _attackerId = message.readIntFrom4();
        _targetId = message.readIntFrom4();
        _hitValue = message.readIntFrom2();
        _currentHealth = message.readIntFrom2();
        /* custom end */
    }

    public int getMessageId() {
        return ORMessageIDs.MSGID_GAME_CHARACTER_HIT_INFO;
    }

    public ORMessage getData() {
        return _message;
    }

    /* message custom */

    public int getAttackerId() {
        return _attackerId;
    }
    public int getTargetId() {
        return _targetId;
    }
    public int getHitValue() {
        return _hitValue;
    }
    public int getCurrentHealth() {
        return _currentHealth;
    }

    /* message custom end */
}
