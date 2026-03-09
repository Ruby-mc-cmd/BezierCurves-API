# 始点 : P₀
# 制御点 : P₁
# 終点 : P₂
#
# 式 : B(t) = (1-t)²P₀ + 2(1-t)tP₁ + t²P₂ (0≦t≦1)
#
# macro : {t,p0_x,p0_y,p0_z,p1_x,p1_y,p1_z,p2_x,p2_y,p2_z,run_command}

scoreboard objectives add yrhBezierCurves.Global dummy

$data merge storage yrh:bezier_curves {t:$(t),p0_x:$(p0_x),p0_y:$(p0_y),p0_z:$(p0_z),p1_x:$(p1_x),p1_y:$(p1_y),p1_z:$(p1_z),p2_x:$(p2_x),p2_y:$(p2_y),p2_z:$(p2_z),run_command:"$(run_command)"}

# t → ×100
execute store result score $t yrhBezierCurves.Global run data get storage yrh:bezier_curves t 100

# 座標 → ×1
execute store result score $p0_x yrhBezierCurves.Global run data get storage yrh:bezier_curves p0_x 1
execute store result score $p0_y yrhBezierCurves.Global run data get storage yrh:bezier_curves p0_y 1
execute store result score $p0_z yrhBezierCurves.Global run data get storage yrh:bezier_curves p0_z 1

execute store result score $p1_x yrhBezierCurves.Global run data get storage yrh:bezier_curves p1_x 1
execute store result score $p1_y yrhBezierCurves.Global run data get storage yrh:bezier_curves p1_y 1
execute store result score $p1_z yrhBezierCurves.Global run data get storage yrh:bezier_curves p1_z 1

execute store result score $p2_x yrhBezierCurves.Global run data get storage yrh:bezier_curves p2_x 1
execute store result score $p2_y yrhBezierCurves.Global run data get storage yrh:bezier_curves p2_y 1
execute store result score $p2_z yrhBezierCurves.Global run data get storage yrh:bezier_curves p2_z 1

# tチェック
execute unless score $t yrhBezierCurves.Global matches 0..100 run return fail

# (100-t)
scoreboard players set $100-t yrhBezierCurves.Global 100
scoreboard players operation $100-t yrhBezierCurves.Global -= $t yrhBezierCurves.Global

# (100-t)²
scoreboard players operation $a yrhBezierCurves.Global = $100-t yrhBezierCurves.Global
scoreboard players operation $a yrhBezierCurves.Global *= $100-t yrhBezierCurves.Global

# 2(100-t)t
scoreboard players operation $b yrhBezierCurves.Global = $100-t yrhBezierCurves.Global
scoreboard players operation $b yrhBezierCurves.Global *= $t yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global = $b yrhBezierCurves.Global
scoreboard players operation $b yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

# t²
scoreboard players operation $c yrhBezierCurves.Global = $t yrhBezierCurves.Global
scoreboard players operation $c yrhBezierCurves.Global *= $t yrhBezierCurves.Global

# x
scoreboard players operation $x yrhBezierCurves.Global = $a yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global *= $p0_x yrhBezierCurves.Global

scoreboard players operation $tmp yrhBezierCurves.Global = $b yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p1_x yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

scoreboard players operation $tmp yrhBezierCurves.Global = $c yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p2_x yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

# y
scoreboard players operation $y yrhBezierCurves.Global = $a yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global *= $p0_y yrhBezierCurves.Global

scoreboard players operation $tmp yrhBezierCurves.Global = $b yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p1_y yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

scoreboard players operation $tmp yrhBezierCurves.Global = $c yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p2_y yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

# z
scoreboard players operation $z yrhBezierCurves.Global = $a yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global *= $p0_z yrhBezierCurves.Global

scoreboard players operation $tmp yrhBezierCurves.Global = $b yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p1_z yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

scoreboard players operation $tmp yrhBezierCurves.Global = $c yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p2_z yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global += $tmp yrhBezierCurves.Global

# ÷10000
execute store result storage yrh:bezier_curves x double 0.0001 run scoreboard players get $x yrhBezierCurves.Global
execute store result storage yrh:bezier_curves y double 0.0001 run scoreboard players get $y yrhBezierCurves.Global
execute store result storage yrh:bezier_curves z double 0.0001 run scoreboard players get $z yrhBezierCurves.Global

function yrh.bezier_curves:sys/run_command with storage yrh:bezier_curves

scoreboard objectives remove yrhBezierCurves.Global
