Animation = Class{}

function Animation:init(params)
    self.texture = params.texture
    self.frames = params.frames
    self.interval = params.interval or 0.05
    self.timer = 0
    self.currentframe = 1
end


function Animation:getCurrentFrame()
    return self.frames[self.currentframe]
end

function Animation:restart()
    self.timer = 0
    self.currentframe = 1
end

function Animation:update(dt)
    self.timer = self.timer + dt

    if #self.frames == 1 then
        return self.currentframe
    else 
        while self.timer > self.interval do
            self.timer = self.timer - self.interval

            self.currentframe = (self.currentframe + 1) % (#self.Frames + 1)

            if self.currentframe == 0 then self.currentframe = 1 end
        end
    end
end


