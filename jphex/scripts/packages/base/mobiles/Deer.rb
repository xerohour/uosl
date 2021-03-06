#-------------------------------------------------------------------------------
# Copyright (c) 2013 Folke Will <folke.will@gmail.com>
# 
# This file is part of JPhex.
# 
# JPhex is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# JPhex is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------
require './scripts/packages/base/mobiles/BaseMobile'
class Deer < BaseMobile
  include MobileBehavior

  @@loot_table = [
      {:graphic => 0, :behavior => "food", :chance => 1.0, :count => 1..3},
      {:graphic => 0x01F8, :chance => 1.0, :amount => 10..20, :count => 1} # gold
    ]

  def onSpawn(mob)
    $api.setName(mob, "a deer")
    $api.setGraphic(mob, 0x34)

    setType(mob, :shy)
    setStats(mob, :str => 20..30, :dex => 10..15, :int => 20..30)

    $api.setAttribute(mob, Attribute::MELEE, 250)
    $api.setAttribute(mob, Attribute::BATTLE_DEFENSE, 300)
  end

  def onDeath(me, corpse)
    generateLoot(corpse, @@loot_table)
  end
end
