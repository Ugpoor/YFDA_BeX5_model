<?php

class WxPayNotify {
    
    public static function service($params, $context)
    {
        if (!isset($_REQUEST["return_code"]))
        {
            return;
        }
            
        $resultCode = $_REQUEST["return_code"];
        if ("SUCCESS" == $resultCode)
        {
            if (!isset($_REQUEST["result_code"]))
            {
                return;
            }
            
            $resultCode = $_REQUEST["result_code"];
            if ($resultCode == "FAIL")
            {
                $err_code = $_REQUEST["err_code"];
                $err_code_des = $_REQUEST["err_code_des"];
                $out_trade_no = $_REQUEST["out_trade_no"];
                //log.info("有一个交易失败[" + err_code + "]:" + err_code_des + "out_trade_no:" + out_trade_no);
            }
            else if ($resultCode == "SUCCESS")
            {
                if (!isset($_REQUEST["out_trade_no"]))
                {
                    return;
                }
                
                $out_trade_no = $_REQUEST["out_trade_no"];
                //echo 'ok';
                /**
             TODO 最好数据库里面有单独的订单支付模块
                    首先检查对应业务数据的状态，判断该通知是否已经处理过，
                    如果没有处理过再进行处理，如果处理过直接返回结果成功。
                    在对业务数据进行状态检查和处理之前，要采用数据锁进行并发控制，以避免函数重入造成的数据混乱。
             * 
             */
                //log.info("订单:" + out_trade_no + ",交易成功");
            }
        }
        else if ("FAIL" == $resultCode)
        {
            $returnMsg = $_REQUEST["return_msg"];
            //log.error("有失败交易需要关注:" + returnMsg);
        }
        else
        {
            header('Content-type: text/html; charset=utf-8');
            echo "不成功！";
            return;
        }
        
        ob_clean();
        echo "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
    }
}

?>