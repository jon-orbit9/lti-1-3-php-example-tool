<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../db/example_database.php';

use \IMSGlobal\LTI;
$launch = LTI\LTI_Message_Launch::from_cache($_REQUEST['launch_id'], new Example_Database());
/*  Jon commented out the following since no deep linking launch is necc for our simple use case. 
   if (!$launch->is_deep_link_launch()) {
    throw new Exception("Must be a deep link!");
}
$resource = LTI\LTI_Deep_Link_Resource::new()
    ->set_url(TOOL_HOST . "/game.php")
    ->set_custom_params(['difficulty' => $_REQUEST['diff']])
    ->set_title('Breakout ' . $_REQUEST['diff'] . ' mode!');
$launch->get_deep_link()
    ->output_response_form([$resource]);
*/
?>
