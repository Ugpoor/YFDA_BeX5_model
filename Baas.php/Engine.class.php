<?php

require_once("ActionContext.class.php");
require_once("CRUD.class.php");
require_once("BaasData.php");

class Engine
{
    public static function ExecAction($actionPath, $paramObject)
    {
        //echo $actionPath;
        $allPath = explode("/", $actionPath);
        $action = Engine::GetAction($actionPath);
        try
        {
            //var_dump($allPath);
            //var_dump($action);
            //$ownerClass = new ReflectionClass($action->Clazz);
            if (count($allPath) > 2)
            {
            	$requirePath = $allPath[3]."/";
            }
            else
            {
            	$requirePath = "";
            }
                        
            $module_file = $requirePath.$action->Clazz.'.php';
            
            //echo $module_file;

            if (file_exists($module_file))
            {
                //echo 'file exits';
                include $module_file; 
                
                $modele_name = $action->Clazz;
                $ownerClass = new $modele_name();
                $method_name = $action->Name;
                //echo $method_name;
                if (method_exists($ownerClass, $method_name))
                {
                    $ownerClass->$method_name($paramObject, null);
                }
            }

            return null;
        }
        catch (Exception $e)
        {
            throw new Exception("获取Class[" . $action->Clazz . "]失败", $e);
        }
        catch (MethodAccessException $e)
        {
            throw new Exception("获取Class[" . $action->Clazz . "] Method[" . $action->Name . "]失败", $e);
        }
        catch (ArgumentException $e)
        {
            throw new Exception("执行Class[" . $action->Clazz . "] Method[" . $action->Name . "]失败", $e);
        }
    }

    private static function GetAction($actionPath)
    {
        $paths = explode('/', $actionPath);
        //var_dump($paths);
        if (sizeof($paths) >= 2)
        {
            $name = Engine::GetActionName($paths);
            $clazzName = Engine::GetClassName($paths);
            $packageName = Engine::GetPackageName($paths);

            $classParam = $clazzName;
            if (!is_numeric($packageName) && !empty($packageName))
            {
                $classParam = $packageName . "." . $clazzName;
            }
            
            $action = new ActionDef($name, $classParam);
            //var_dump($action);
            return $action;
        }
        else
        {
            return null;
        }
    }

    private static function GetPackageName($paths)
    {
        $excludeNamespace = "baas";

        if (sizeof($paths) >= 2)
        {
            $name = "";
            for ($i = 0; $i < sizeof($paths) - 2; $i++)
            {
                if ($excludeNamespace != strtolower($paths[$i]))
                {
                    if (!is_numeric($name) && !empty($name))
                    {
                        $name += "."; 
                    }
                    else
                    {
                        $name += "";
                    }
                    
                    $name += $paths[$i];
                }
            }

            return $name;
        }

        return null;
    }

    private static function GetClassName($paths)
    {
        if (sizeof($paths) >= 2)
        {
            $clz = $paths[sizeof($paths) - 2];
            if (!is_numeric($clz) && !empty($clz))
            {
                $clz = strtoupper(substr($clz, 0, 1)).substr($clz, 1);
            }            
            //echo $clz;
            
            $result = Engine::GetRunTimeClassName($clz);  
            //echo $result;
            return $result;
        }
        else
            return null;
    }

    private static function GetActionName($paths)
    {
        if (sizeof($paths) >= 2)
        {
            return $paths[sizeof($paths) - 1];
        }
        else
            return null;
    }

    public static function GetRunTimeClassName($clazz)
    {
        return $clazz."__do";
    }
}













?>