Locales['it'] = {
    -- client/cornerselling.lua

    ['client_cornerselling_event_cornerselling_notify_1'] = 'Posizione di vendita cambiato.. yeet',
    ['client_cornerselling_event_cornerselling_notify_2'] = 'Posizione di vendita all\'angolo disabilitata',
    ['client_cornerselling_event_cornerselling_notify_3'] = 'Non porti erba con te..',
    ['client_cornerselling_toFarAway_notify'] = 'You are moving too much, start over again!',

    ['client_cornerselling_createthread_drawtext3d'] = '[~g~E~w~] Ritira',

    ['client_cornerselling_function_SellToPed_notify_1'] = 'Sei stato derubato e hai perso %s sacchetti',
    ["client_cornerselling_function_SellToPed_drawtext3d"] = '~g~E~w~ %sx %s per $%s / ~g~G~w~ Declina offerta',
    ['client_cornerselling_function_SellToPed_notify_2'] = 'Offerta accettata!',
    ['client_cornerselling_function_SellToPed_notify_3'] = 'Offerta cancellata!',

    -- client/deliveries.lua

    ['client_deliveries_createthread_drawtext3d_1'] = '[~g~E~w~] Bussa',
    ['client_deliveries_createthread_drawtext3d_2'] = '[~g~E~w~] Compra / [~g~G~w~] Help your guy ($5000)',
    ['client_deliveries_createthread_drawtext3d_3'] = '[~g~E~w~] Compra / [~g~G~w~] Avvia missione',

    ['client_deliveries_createthread_progressbar_1'] = "Rimetteri in piedi la persona..",

    ['client_deliveries_createthread_notify_1'] = "Hai aiutato una persona!",
    ['client_deliveries_createthread_notify_2'] = "Fallito!",

    ['client_deliveries_createthread_notify_3'] = "Non c\'è nessuno nelle vicinanze..",

    ['client_deliveries_chatmessage_dealer_sender'] = "Pusher %s",
    ['client_deliveries_createthread_chatmessage_1_receiver'] = "Questi sono i prodotti, mi tengo in contatto tramite e-mail",
    ['client_deliveries_createthread_chatmessage_2_receiver'] = 'Devi ancora completare una consegna, cosa stai aspettando?!',

    ["client_deliveries_function_knockDoorAnim_chatMessage_1_receiver"] = 'Ciao figliulo, cosa posso fare per te',
    ["client_deliveries_function_knockDoorAnim_chatMessage_2_receiver"] = 'Sfortunatamente non faccio più affari... Avresti dovuto trattarmi meglio!!',
    ["client_deliveries_function_knockDoorAnim_chatMessage_3_receiver"] = 'Yo %s, cosa posso fare per te?',

    ['client_deliveries_function_knockDoorAnim_notify_1'] = 'Sembra che nessuno sia in casa..',

    ["client_deliveries_event_giveDeliveryItems_subject"] = "Luogo della consegna ",
    ["client_deliveries_event_giveDeliveryItems_message"] = "Ecco tutte le informazioni sulla consegna, <br>Oggetti: <br> %sx %s<br><br> Arriva in tempo!!",

    ['client_deliveries_function_setMapBlip_notify_1'] = 'Il percorso verso il luogo di consegna è stato impostato sulla mappa.',

    ["client_deliveries_event_setLocation_notify"] = 'Hai ancora una consegna aperta...',

    ["client_deliveries_createthread_DrawText3D_1"] = '[~g~E~w~] %sx %s pusher.',

    ['client_deliveries_function_deliverStuff_Progressbar_1'] = "Consegna prodotti..",
    ['client_deliveries_function_deliverStuff_notify_1'] = "Cancellato..",
    ["client_deliveries_event_robberyCall_chatmessage"] = "911-ALERT",
    ["client_deliveries_event_robberyCall_AddTextComponentString"] = "911: Spaccio",

    ["client_deliveries_event_sendDeliveryMail_subject"] = "Consegna",

    ["client_deliveries_event_sendDeliveryMail_message_1"] = "Hai fatto un buon lavoro, spero di rivederti ;)<br><br>Groeten, %s",
    ["client_deliveries_event_sendDeliveryMail_message_2"] = "Ecco tutte le informazioni sulla consegna, <br>Oggetti: <br> %sx %s<br><br> Arriva in tempo!!",
    ["client_deliveries_event_sendDeliveryMail_message_3"] = "Non hai fatto in tempo! Hai avuto qualcosa di più importante da fare degli affari?!",

    ["client_deliveries_event_GotoDealer_notify_1"] = 'Sei stato teletrasportato: %s Buona fortuna!',

    -- client/main.lua


    -- server/cornerselling.lua
    
    -- client/deliveries.lua
    ["server_deliveries_event_updateDealerItems_notify_1"] =  "Questo articolo non è disponibile.. Hai un rimborso.",
    ["server_deliveries_event_updateDealerItems_notify_2"] = 'L\'ordine è stato consegnato completamente',
    ["server_deliveries_event_updateDealerItems_notify_3"] = 'Questo non soddisfa l\'ordine...',
    ["server_deliveries_event_updateDealerItems_notify_4"] = 'Sei in ritardo...',
    ["server_deliveries_event_callCops_msg"] = "Una situazione sospetta è stata localizzata in %s, possibilmente spaccio di droga.",
    ["server_deliveries_event_callCops_title"] = "Spaccio",

    --Commands
    
    ["server_deliveries_command_commons_name"] ="Nome pusher",

    ["server_deliveries_command_newdealer"] ="Crea un pusher (Admin Only)",
    
    ["server_deliveries_command_newdealer_min"] ="Tempo minimo",
    ["server_deliveries_command_newdealer_max"] ="Tempo massimo",

    ["server_deliveries_command_deletedealer"] ="Elimina un pusher (Admin Only)",
    ["server_deliveries_command_deletedealer_notify_1"] ="Hai eliminato il pusher %s!",
    ["server_deliveries_command_deletedealer_notify_2"] ="Il pusher %s non esiste..",

    ["server_deliveries_command_dealers"] ="Visualizza tutti i pusher (Admin Only)",
    ["server_deliveries_command_dealers_template"] ='<div class="chat-message advert"><div class="chat-message-body"><strong>Lista dei pusher: </strong><br><br> %s</div></div>',
    ["server_deliveries_command_dealers_notify_1"] ='Nessun pusher è stato trovato..',
    ["server_deliveries_command_dealers_notify_2"] ="Il pusher %s non esiste..",

    ["server_deliveries_command_dealergoto"] ="Teletrasportati ad un pusher (Admin Only)",
    ["server_deliveries_command_dealergoto_notify_1"] ='Il pusher %s non esiste..',


}
