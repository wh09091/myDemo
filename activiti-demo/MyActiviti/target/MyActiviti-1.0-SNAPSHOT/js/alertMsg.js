/**
 * Created by QJ-011 on 2017/4/11.
 */
function alertMsg(message){
    BootstrapDialog.show({
        message: message,
        title:'提示',
        type:BootstrapDialog.TYPE_DANGER,
        size:BootstrapDialog.SIZE_SMALL,
        buttons: [{
            label: '关闭',
            action: function(dialogItself){
                dialogItself.close();
            }
        }]
    });
}

function confirmMsg(message,func){
    BootstrapDialog.confirm({
        message:message,
        title:'提示',
        type: BootstrapDialog.TYPE_DANGER,
        btnCancelLabel: '取消',
        btnOKLabel: '确定',
        size: BootstrapDialog.SIZE_SMALL,
        callback:func
    });
}