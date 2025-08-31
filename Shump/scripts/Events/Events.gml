global.EventNames = {
    AlienHit:  "AlienHit"
};

/// event_manager.gml
globalvar EventManager;
EventManager = {
    listeners: {},

    subscribe: function(_event_name, _callback) {
        if (!variable_struct_exists(self.listeners, _event_name)) {
            self.listeners[$ _event_name] = [];
        }
        array_push(self.listeners[$ _event_name], _callback);
    },

    unsubscribe: function(_event_name, _callback) {
        if (variable_struct_exists(self.listeners, _event_name)) {
            var arr = self.listeners[$ _event_name];
            var new_arr = [];
            for (var i = 0; i < array_length(arr); i++) {
                if (arr[i] != _callback) {
                    array_push(new_arr, arr[i]);
                }
            }
            self.listeners[$ _event_name] = new_arr;
        }
    },

    trigger: function(_event_name, _payload) {
        if (variable_struct_exists(self.listeners, _event_name)) {
            var arr = self.listeners[$ _event_name];
            for (var i = 0; i < array_length(arr); i++) {
                arr[i](_payload);
            }
        }
    }
};

/* EXAMPLE

// Example listener
function on_player_hit(payload) {
    show_debug_message("Player took " + string(payload.damage) + " dmg from " + payload.source);
}

// Subscribe
EventManager.subscribe(global.EventNames.PlayerHit, on_player_hit);

// Trigger later (maybe inside a collision or destroy event)
var payload = {
    damage: 15,
    source: "alien_bullet"
};
EventManager.trigger(global.EventNames.PlayerHit, payload);


*/

//this is a callback
function on_alien_death(payload) {
    //show_debug_message("onAlienDeath Payload: " + string(payload.score_amount));
    
    
    if (instance_exists(UberCont)) {
        UberCont.display_subscore = true;
        UberCont.subscore += payload.score_amount;
    }
}
