# 在输入框中判断键盘是否处于大写锁定状态

一般用于密码输入时，提示用户键盘处于大写锁定状态。

- 要判断 `shift` 是否按下

- 判断输入字符是否为字母

    - `shift` 被按下且输入字符为小写字母，则键盘处于大写锁定状态

    - `shift` 没有被按下且输入字符为小写字母，则键盘处于小写锁定状态

```qml
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
```