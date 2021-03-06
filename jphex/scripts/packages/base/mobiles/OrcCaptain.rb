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
class OrcCaptain < BaseMobile
  include MobileBehavior
  
  @@loot_table = [
      {:graphic => 0, :behavior => "food", :chance => 1.0, :count => 1..3},
      {:graphic => 0, :behavior => "sextant", :chance => 0.4, :count => 1},
      {:graphic => 0x387, :chance => 0.4, :count => 1}, # light source scroll
      {:graphic => 0x447, :chance => 0.4, :count => 1}, # healing scroll
      {:graphic => 0x449, :chance => 0.4, :count => 1}, # create food scroll
      {:graphic => 0x444, :chance => 0.2, :count => 1}, # dark source scroll
      {:graphic => 0x445, :chance => 0.1, :count => 1}, # great light scroll
      {:graphic => 0x446, :chance => 0.3, :count => 1}, # light scroll
      {:graphic => 0x448, :chance => 0.2, :count => 1}, # fireball scroll
      {:graphic => 0x386, :chance => 0.1, :count => 1}, # spellbook
      {:graphic => 0x01F8, :chance => 1.0, :amount => 200..250, :count => 1} # gold
    ]

  def onSpawn(mob)
    $api.setName(mob, "an orc captain")
    $api.setGraphic(mob, 0x29)

    setType(mob, :aggressive)
    setStats(mob, :str => 120..160, :dex => 120..160, :int => 20..30)

    $api.setAttribute(mob, Attribute::MELEE, 1000)
    $api.setAttribute(mob, Attribute::BATTLE_DEFENSE, 1000)
    $api.setAttribute(mob, Attribute::MAGIC_DEFENSE, 1000)
  end

  def onDeath(me, corpse)
    generateLoot(corpse, @@loot_table)
  end
end
