-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------

-- forward declarations and other locals
local qckPlayBtn, stngsBtn
local screenW, screenH
screenW = display.contentWidth
screenH = display.contentHeight

-- 'onRelease' event listener for playBtn
local function onQckPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onCstmBtnRelease()

	-- placeholder - just loads level1.lua
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onMPlyrBtnRelease()

	-- placeholder - just loads level1.lua
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end


local function onStngsBtnRelease()

	-- placeholder - just loads level1.lua
	composer.gotoScene( "level1", "fade", 500 )
	
	return true	-- indicates successful touch
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	-- display a background image
	local background = display.newImageRect( "blankmenuscreen.png", screenW, screenH )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0

	-- create a widget button (which will launch a game with predefined settings on release)
	qckPlayBtn = widget.newButton{
		defaultFile="quickgameButton.png",
		overFile="quickgameButton.png",
		onRelease = onQckPlayBtnRelease	-- event listener function
	}
	qckPlayBtn.x = screenW / 2
	qckPlayBtn.y = screenH * ( 4 / 8 )

	-- create a widget button (which will load custom game setup menu on release)
	cstmBtn = widget.newButton{
		defaultFile="customgameButton.png",
		overFile="customgameButton.png",
		onRelease = onCstmBtnRelease	-- event listener function
	}
	cstmBtn.x = screenW / 2
	cstmBtn.y = screenH * ( 5 / 8 )

	-- create a widget button (which will load multiplayer setup menu on release)
	mPlyrBtn = widget.newButton{
		defaultFile="multiplayerButton.png",
		overFile="multiplayerButton.png",
		onRelease = onMPlyrBtnRelease	-- event listener function
	}
	mPlyrBtn.x = screenW / 2
	mPlyrBtn.y = screenH * ( 6 / 8 )

	-- create a widget button (which will load settings menu on release)
	stngsBtn = widget.newButton{
		defaultFile="settingsButton.png",
		overFile="settingsButton.png",
		onRelease = onStngsBtnRelease	-- event listener function
	}
	stngsBtn.x = screenW / 2
	stngsBtn.y = screenH * ( 7 / 8 )

	

	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( qckPlayBtn )
	sceneGroup:insert( cstmBtn )
	sceneGroup:insert( mPlyrBtn )
	sceneGroup:insert( stngsBtn )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

--pulses menu text
local function1, function2

function function1(e)
  transition.to(qckPlayBtn,{time=1000,alpha=1, onComplete=function2})
end

function function2(e)
  transition.to(qckPlayBtn,{time=1000,alpha=0, onComplete=function1})
end

transition.to(qckPlayBtn,{time=1000,alpha=0, onComplete = function1})

return scene