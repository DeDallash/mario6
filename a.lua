
    -- begin generating the terrain using vertical scan lines
    local x = 1
    while x < self.mapWidth do
        
        -- 2% chance to generate a cloud
        -- make sure we're 2 tiles from edge at least
        if x < self.mapWidth - 2 then
            if math.random(20) == 1 then
                
                -- choose a random vertical spot above where blocks/pipes generate
                local cloudStart = math.random(self.mapHeight / 2 - 6)

                self:setTile(x, cloudStart, CLOUD_LEFT)
                self:setTile(x + 1, cloudStart, CLOUD_RIGHT)
            end
        end

        -- 5% chance to generate a mushroom
        if math.random(20) == 1 then
            -- left side of pipe
            self:setTile(x, self.mapHeight / 2 - 2, MUSHROOM_TOP)
            self:setTile(x, self.mapHeight / 2 - 1, MUSHROOM_BOTTOM)

            -- creates column of tiles going to bottom of map
            --for y = self.mapHeight / 2, self.mapHeight do
            --    self:setTile(x, y, TILE_BRICK)
            --end

            -- next vertical scan line
            x = x + 1

        -- 10% chance to generate bush, being sure to generate away from edge
        elseif math.random(10) == 1 and x < self.mapWidth - 3 then
            local bushLevel = self.mapHeight / 2 - 1

            -- place bush component and then column of bricks
            self:setTile(x, bushLevel, BUSH_LEFT)
            --for y = self.mapHeight / 2, self.mapHeight do
            --    self:setTile(x, y, TILE_BRICK)
            --end
            x = x + 1

            self:setTile(x, bushLevel, BUSH_RIGHT)
            --for y = self.mapHeight / 2, self.mapHeight do
            --    self:setTile(x, y, TILE_BRICK)
            --end
            x = x + 1

        -- 10% chance to not generate anything, creating a gap
        elseif math.random(10) ~= 1 then
            
            -- creates column of tiles going to bottom of map
            --for y = self.mapHeight / 2, self.mapHeight do
            --    self:setTile(x, y, TILE_BRICK)
            --end

            -- chance to create a block for Mario to hit
            if math.random(15) == 1 then
                self:setTile(x, self.mapHeight / 2 - 4, JUMP_BLOCK)
            end

            -- next vertical scan line
            x = x + 1
        else
            -- increment X so we skip two scanlines, creating a 2-tile gap
            x = x + 2
        end
    