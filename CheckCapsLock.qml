/*
 * author qyvlik
 * email qyvlik@qq.com
 * 2015.08.15
*/

import QtQuick 2.4

Rectangle {
    border.color: "#ccc"
    border.width: 2
    anchors.fill: parent

    TextInput {
        id:textField;

        font.pixelSize: 24
        focus:true

        property bool shiftIsPressed: false

        Keys.onPressed: {
            if(event.key == Qt.Key_Shift  ) {
                shiftIsPressed = true;
            }
        }

        Keys.onReleased: {
            if(event.key == Qt.Key_Shift)
                shiftIsPressed = false;
        }

        onTextChanged: {
            var letter = text[text.length - 1];
            console.log(isUpperLock(shiftIsPressed, letter));
        }

        function isalpha(letter){
            var alpha = String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
            var i;
            for(i in alpha )
                if(letter == alpha[i])
                    return true;
            return false;
        }

        function isLowerCaseChar(letter){
            var lowcases = String("abcdefghijklmnopqrstuvwxyz");
            for(var i in lowcases) {
                if(letter ==  lowcases[i]){
                    return true;
                }
            }
            return false;
        }

        function isUpperLock(shift, letter){
            if(!isalpha((letter))) return false;
            // shift键按下
            // 且输入字符为小写
            // 则大写锁定为开启
            if(shift) {
                if(isLowerCaseChar(letter))
                    return true;
                else
                    return false;
            } else {
                if(isLowerCaseChar(letter))
                    return false;
                else
                    return true;
            }
        }
    }
}
