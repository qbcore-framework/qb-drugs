Locales['en'] = {
    -- client/cornerselling.lua

    ['client_cornerselling_event_cornerselling_notify_1'] = 'Flicked the cornerselling switch.. yeet',
    ['client_cornerselling_event_cornerselling_notify_2'] = 'Corner selling position disabled .. yeet',
    ['client_cornerselling_event_cornerselling_notify_3'] = 'You aren\'t carrying any weed with you..',
    ['client_cornerselling_toFarAway_notify'] = 'You are moving too much, start over again!',

    ['client_cornerselling_createthread_drawtext3d'] = '[E] Pick up',

    ['client_cornerselling_function_SellToPed_notify_1'] = 'You have been robbed and lost %s bags(\'s) %s',
    ["client_cornerselling_function_SellToPed_drawtext3d"] = '~g~E~w~ %sx %s for $%s / ~g~G~w~ Decline offer',
    ['client_cornerselling_function_SellToPed_notify_2'] = 'Offer accepted!',
    ['client_cornerselling_function_SellToPed_notify_3'] = 'Offer canceled!',

    -- client/deliveries.lua

    ['client_deliveries_createthread_drawtext3d_1'] = '[E] To knock',
    ['client_deliveries_createthread_drawtext3d_2'] = '[E] To buy / [G] Help your guy ($5000)',
    ['client_deliveries_createthread_drawtext3d_3'] = '[E] To buy / [G] Start a mission',

    ['client_deliveries_createthread_progressbar_1'] = "Put person back on their feet..",

    ['client_deliveries_createthread_notify_1'] = "You have helped a person!",
    ['client_deliveries_createthread_notify_2'] = "Failed!",

    ['client_deliveries_createthread_notify_3'] = "There is no one nearby..",

    ['client_deliveries_chatmessage_dealer_sender'] = "Dealer %s",
    ['client_deliveries_createthread_chatmessage_1_receiver'] = "These are the products, I\'ll keep in touch through email",
    ['client_deliveries_createthread_chatmessage_2_receiver'] = 'You still need to complete a delivery, what are you waiting for?!',

    ["client_deliveries_function_knockDoorAnim_chatMessage_1_receiver"] = 'Hello my child, what can I do for you',
    ["client_deliveries_function_knockDoorAnim_chatMessage_2_receiver"] = 'Unfortunately I don\'t do business anymore ... You should have treated me better',
    ["client_deliveries_function_knockDoorAnim_chatMessage_3_receiver"] = 'Yo %s, what can I do for you?',

    ['client_deliveries_function_knockDoorAnim_notify_1'] = 'It looks like no one is home..',

    ["client_deliveries_event_giveDeliveryItems_subject"] = "Delivery Location",
    ["client_deliveries_event_giveDeliveryItems_message"] = "Here is all info about the delivery, <br>Items: <br> %sx %s<br><br> be in time!!",

    ['client_deliveries_function_setMapBlip_notify_1'] = 'The route to the delivery location has been set on your map.',

    ["client_deliveries_event_setLocation_notify"] = 'You still have an open delivery...',

    ["client_deliveries_createthread_DrawText3D_1"] = '[E] %sx %s deliver.',

    ['client_deliveries_function_deliverStuff_Progressbar_1'] = "Delivering products..",
    ['client_deliveries_function_deliverStuff_notify_1'] = "Canceled..",
    ["client_deliveries_event_robberyCall_chatmessage"] = "911-ALERT",
    ["client_deliveries_event_robberyCall_AddTextComponentString"] = "911: Drug Dealing",

    ["client_deliveries_event_sendDeliveryMail_subject"] = "Levering",

    ["client_deliveries_event_sendDeliveryMail_message_1"] = "You did good work, hope to see you again ;)<br><br>Groeten, %s",
    ["client_deliveries_event_sendDeliveryMail_message_2"] = "Here is all info about the delivery, <br>Items: <br> %sx %s<br><br> be in time!!",
    ["client_deliveries_event_sendDeliveryMail_message_3"] = "You weren\'t on time. Did you have more important things to do than business?",

    ["client_deliveries_event_GotoDealer_notify_1"] = 'You have been teleported : %s Good luck!',

    -- client/main.lua


    -- server/cornerselling.lua
    
    -- client/deliveries.lua
    ["server_deliveries_event_updateDealerItems_notify_1"] =  "This item is not available.. You've got an refund.",
    ["server_deliveries_event_updateDealerItems_notify_2"] = 'The order has been delivered completely',
    ["server_deliveries_event_updateDealerItems_notify_3"] = 'This doesn\'t meet the order...',
    ["server_deliveries_event_updateDealerItems_notify_4"] = 'You\'re too late...',
    ["server_deliveries_event_callCops_msg"] = "A suspicious situation has been located at %s, possibly drug dealing.",
    ["server_deliveries_event_callCops_title"] = "Drug Dealing",

    --Commands

    
    ["server_deliveries_command_commons_name"] ="Dealer name",

    ["server_deliveries_command_newdealer"] ="Place A Dealer (Admin Only)",
    
    ["server_deliveries_command_newdealer_min"] ="Minimum time",
    ["server_deliveries_command_newdealer_max"] ="Maximum time",

    ["server_deliveries_command_deletedealer"] ="Delete A Dealer (Admin Only)",
    ["server_deliveries_command_deletedealer_notify_1"] ="You deleted Dealer %s!",
    ["server_deliveries_command_deletedealer_notify_2"] ="Dealer %s doesn\'t exist..",

    ["server_deliveries_command_dealers"] ="View All Dealers (Admin Only)",
    ["server_deliveries_command_dealers_template"] ='<div class="chat-message advert"><div class="chat-message-body"><strong>List of all dealers: </strong><br><br> %s</div></div>',
    ["server_deliveries_command_dealers_notify_1"] ='No dealers have been placed.',
    ["server_deliveries_command_dealers_notify_2"] ="Dealer %s doesn\'t exist..",

    ["server_deliveries_command_dealergoto"] ="Teleport To A Dealer (Admin Only)",
    ["server_deliveries_command_dealergoto_notify_1"] ='This dealer doesn\'t exist.',

    
    
}
