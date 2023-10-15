package android;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxSave;
import flixel.math.FlxPoint;

import android.FlxVirtualPad;

class Config {
	var save:FlxSave;
    var isExtend:Bool = false;
	public function new(saveName:String) {
		save = new FlxSave();
		save.bind(saveName);
		
		if (saveName == 'saved-extendControls') isExtend = true;
	}

	public function getcontrolmode():Int {
		if (save.data.buttonsmode != null) 
			return save.data.buttonsmode[0];
		return 0;
	}

	public function setcontrolmode(mode:Int = 0):Int {
		if (save.data.buttonsmode == null) save.data.buttonsmode = new Array();
		save.data.buttonsmode[0] = mode;
		save.flush();
		return save.data.buttonsmode[0];
	}

	public function savecustom(_pad:FlxVirtualPad) {
		if (save.data.buttons == null)
		{
			save.data.buttons = new Array();
			if (!isExtend){
    			for (buttons in _pad){
    				save.data.buttons.push(FlxPoint.get(buttons.x, buttons.y));
    			}
			}
			else{
			    save.data.buttons[0] = FlxPoint.get(_pad.buttonG.x, _pad.buttonG.y);
			    save.data.buttons[1] = FlxPoint.get(_pad.buttonF.x, _pad.buttonF.y);
			}
		}else{
		    if (!isExtend){
			    var tempCount:Int = 0;
			    for (buttons in _pad){
				    save.data.buttons[tempCount] = FlxPoint.get(buttons.x, buttons.y);
				    tempCount++;
				}
			}
			else{
			    save.data.buttons[0] = FlxPoint.get(_pad.buttonG.x, _pad.buttonG.y);
			    save.data.buttons[1] = FlxPoint.get(_pad.buttonF.x, _pad.buttonF.y);
			}
		}
		save.flush();
	}

	public function loadcustom(_pad:FlxVirtualPad):FlxVirtualPad {
		if (save.data.buttons == null) 
			return _pad; 
		var tempCount:Int = 0;
		
		if (!isExtend){
    		for(buttons in _pad){
    			buttons.x = save.data.buttons[tempCount].x;
    			buttons.y = save.data.buttons[tempCount].y;
    			tempCount++;
    		}
		}
		else{
		    if (_pad.buttonG != null){
		        _pad.buttonG.x = save.data.buttons[0].x;
			    _pad.buttonG.y = save.data.buttons[0].y;
			}
			if (_pad.buttonF != null){
			    _pad.buttonF.x = save.data.buttons[1].x;
			    _pad.buttonF.y = save.data.buttons[1].y;
			}
		}
		return _pad;
	}
}

class AndroidControls extends FlxSpriteGroup {
	public var mode:ControlsGroup = HITBOX;

	public var newhbox:FlxNewHitbox;
	public var vpad:FlxVirtualPad;

	var config:Config;
	var extendConfig:Config;

	public function new() {
		super();

		config = new Config('saved-controls');
		extendConfig = new Config('saved-extendControls');

		mode = getModeFromNumber(config.getcontrolmode());

		switch (mode){
			case VIRTUALPAD_RIGHT:
				initControler(0);
			case VIRTUALPAD_LEFT:
				initControler(1);
			case VIRTUALPAD_CUSTOM:
				initControler(2);
			case DUO:
				initControler(3);
			case HITBOX:
		        initControler(4);		    
			case KEYBOARD:
			    // nothing happened
		}
	}

	function initControler(vpadMode:Int) {
		switch (vpadMode){
			case 0:
				vpad = new FlxVirtualPad(RIGHT_FULL, controlExtend, 0.75, ClientPrefs.data.antialiasing);	
				add(vpad);						
				vpad = extendConfig.loadcustom(vpad);
			case 1:
				vpad = new FlxVirtualPad(FULL, controlExtend, 0.75, ClientPrefs.data.antialiasing);
				add(vpad);			
				vpad = extendConfig.loadcustom(vpad);
			case 2:
				vpad = new FlxVirtualPad(FULL, controlExtend, 0.75, ClientPrefs.data.antialiasing);
				vpad = config.loadcustom(vpad);
				vpad = extendConfig.loadcustom(vpad);
				add(vpad);	
			case 3:
				vpad = new FlxVirtualPad(DUO, controlExtend, 0.75, ClientPrefs.data.antialiasing);
				add(vpad);		
				vpad = extendConfig.loadcustom(vpad);
			case 4:
			  newhbox = new FlxNewHitbox();
			  add(newhbox);
			default:
				vpad = new FlxVirtualPad(RIGHT_FULL, controlExtend, 0.75, ClientPrefs.data.antialiasing);	
				add(vpad);					
				vpad = extendConfig.loadcustom(vpad);
		}
	}

	public static function getModeFromNumber(modeNum:Int):ControlsGroup {
		return switch (modeNum){
			case 0: 
				VIRTUALPAD_RIGHT;
			case 1: 
				VIRTUALPAD_LEFT;
			case 2: 
				VIRTUALPAD_CUSTOM;
			case 3: 
				DUO;
			case 4: 
				HITBOX;	
			case 5: 
				KEYBOARD;
			default: 
				VIRTUALPAD_RIGHT;
		}
	}
}

enum ControlsGroup {
	VIRTUALPAD_RIGHT;
	VIRTUALPAD_LEFT;
	VIRTUALPAD_CUSTOM;
	DUO;
	HITBOX;
	KEYBOARD;
}
