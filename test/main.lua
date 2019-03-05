local function RectCollision ( self, event )
    	local phase = event.phase  
    	local other = event.other
        print( self.width, other.width )
        local new_width = self.width+other.width
        local forceModifier = 0.01

    	local function CombineRects ()
            
            transition.to( self, { time = 400, transition = easing.inOutCubic, alpha = 0 } ) 
            transition.to( other, { time = 400, transition = easing.inOutCubic, alpha = 0 } )
            local CombinedRect = display.newRect( self.x, self.y, 10, self.height )
            CombinedRect.fill = self.colour
            CombinedRect.colourname = self.colourname
            CombinedRect.type = 'rect'
            CombinedRect.alpha = 0 
            transition.to( CombinedRect, { time = 400, transition =  easing.inOutCubic, alpha = 1, width = new_width, onStart = function() display.remove(self) ; 
                                            display.remove(other) end } )
            timer.performWithDelay( 20, function () 
            	physics.addBody( CombinedRect, {density = 1.8, bounce = 0, friction = 10} ) 
            	CombinedRect:applyForce( forceModifier*(halfW-CombinedRect.x), forceModifier*(halfH-CombinedRect.y), CombinedRect.x, CombinedRect.y )
            	CombinedRect.touch = RectControl
            	CombinedRect:addEventListener("touch")
            	CombinedRect.collision = RectCollision
            	CombinedRect:addEventListener("collision")
            	mapGroup:insert(CombinedRect)
            end )
    	end

    	local function reSize(obj)  
    	   	local new_radius = obj.path.radius*1.2
            local enlargedCircle = display.newCircle ( obj.x, obj.y, new_radius )
            enlargedCircle.fill = obj.colour 
            enlargedCircle.colourname = obj.colourname
            enlargedCircle.type = obj.type
            timer.performWithDelay( 40, function () physics.addBody( enlargedCircle, 'static', {radius = new_radius, density = 1, 
            	bounce = 0.3, friction = 10} )           	
            	print( enlargedCircle.colourname, 'circle enlarged, radius:', enlargedCircle.path.radius )
            	mapGroup:insert(enlargedCircle)
            end )  
    	end

    	if (phase == 'began') then
    		print(phase, self.colourname, 'collided with', other.colourname, other.type)   
    		if other.type == 'rect' then        
    			ObjColourBehaviour( self, other ) 
            	timer.performWithDelay( 40, CombineRects() )
         	elseif other.type == 'ObjCircle' then
         		print( other.colourname, 'circle original radius:', other.path.radius )
         		transition.to( other, { time = 200, transition = easing.inCirc, width = other.width*1.2, height = other.height*1.2, 
         			onComplete = function ()
         				reSize(other)
         			end} )
         	end
    	elseif (phase == 'ended') then
    		
    	end

    	return true
    end