# 始点 : P₀
# 制御点1 : P₁
# 制御点2 : P₂
# 終点 : P₃
#
# 式 : B(t) = (1-t)³P₀ + 3(1-t)²tP₁ + 3(1-t)t²P₂ + t³P₃ (0≦t≦1)
#
# macro : {t, p0_x, p0_y, p0_z, p1_x, p1_y, p1_z, p2_x, p2_y, p2_z, p3_x, p3_y, p3_z}

# スコアを作成
scoreboard objectives add yrhBezierCurves.Global dummy

# 代入
$data merge storage yrh:bezier_curves {t:$(t),p0_x:$(p0_x),p0_y:$(p0_y),p0_z:$(p0_z),p1_x:$(p1_x),p1_y:$(p1_y),p1_z:$(p1_z),p2_x:$(p2_x),p2_y:$(p2_y),p2_z:$(p2_z),p3_x:$(p3_x),p3_y:$(p3_y),p3_z:$(p3_z),run_command:"$(run_command)"}

# 10倍にしてスコア化
execute store result score $t yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves t 100
execute store result score $p0_x yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p0_x 10
execute store result score $p0_y yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p0_y 10
execute store result score $p0_z yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p0_z 10
execute store result score $p1_x yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p1_x 10
execute store result score $p1_y yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p1_y 10
execute store result score $p1_z yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p1_z 10
execute store result score $p2_x yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p2_x 10
execute store result score $p2_y yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p2_y 10
execute store result score $p2_z yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p2_z 10
execute store result score $p3_x yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p3_x 10
execute store result score $p3_y yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p3_y 10
execute store result score $p3_z yrhBezierCurves.Global run \
    data get storage yrh:bezier_curves p3_z 10

# tが0~1ではなかったときに終了
execute unless score $t yrhBezierCurves.Global matches 0..100 run \
    return fail

# (10-t)を計算
scoreboard players set $10-t yrhBezierCurves.Global 10
scoreboard players operation $10-t yrhBezierCurves.Global -= $t yrhBezierCurves.Global

# (10-t)³を計算
scoreboard players operation $(10-t)³ yrhBezierCurves.Global = $10-t yrhBezierCurves.Global
scoreboard players operation $(10-t)³ yrhBezierCurves.Global *= $10-t yrhBezierCurves.Global
scoreboard players operation $(10-t)³ yrhBezierCurves.Global *= $10-t yrhBezierCurves.Global

# 3(1-t)²tを計算
scoreboard players operation $3(1-t)²t yrhBezierCurves.Global = $10-t yrhBezierCurves.Global
scoreboard players operation $3(1-t)²t yrhBezierCurves.Global *= $10-t yrhBezierCurves.Global
scoreboard players operation $3(1-t)²t yrhBezierCurves.Global += $3(1-t)²t yrhBezierCurves.Global
scoreboard players operation $3(1-t)²t yrhBezierCurves.Global += $3(1-t)²t yrhBezierCurves.Global
scoreboard players operation $3(1-t)²t yrhBezierCurves.Global *= $t yrhBezierCurves.Global

# 3(1-t)t²を計算
scoreboard players operation $3(1-t)t² yrhBezierCurves.Global = $10-t yrhBezierCurves.Global
scoreboard players operation $3(1-t)t² yrhBezierCurves.Global += $3(1-t)t² yrhBezierCurves.Global
scoreboard players operation $3(1-t)t² yrhBezierCurves.Global += $3(1-t)t² yrhBezierCurves.Global
scoreboard players operation $3(1-t)t² yrhBezierCurves.Global *= $t yrhBezierCurves.Global
scoreboard players operation $3(1-t)t² yrhBezierCurves.Global *= $t yrhBezierCurves.Global

# t³
scoreboard players operation $t³ yrhBezierCurves.Global = $t yrhBezierCurves.Global
scoreboard players operation $t³ yrhBezierCurves.Global *= $t yrhBezierCurves.Global
scoreboard players operation $t³ yrhBezierCurves.Global *= $t yrhBezierCurves.Global

# x
scoreboard players operation $tmp yrhBezierCurves.Global = $(10-t)³ yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p0_x yrhBezierCurves.Global
scoreboard players operation $tmp2 yrhBezierCurves.Global = $3(1-t)²t yrhBezierCurves.Global
scoreboard players operation $tmp2 yrhBezierCurves.Global *= $p1_x yrhBezierCurves.Global
scoreboard players operation $tmp3 yrhBezierCurves.Global = $3(1-t)t² yrhBezierCurves.Global
scoreboard players operation $tmp3 yrhBezierCurves.Global *= $p2_x yrhBezierCurves.Global
scoreboard players operation $tmp4 yrhBezierCurves.Global = $t³ yrhBezierCurves.Global
scoreboard players operation $tmp4 yrhBezierCurves.Global *= $p3_x yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global = $tmp yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global += $tmp2 yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global += $tmp3 yrhBezierCurves.Global
scoreboard players operation $x yrhBezierCurves.Global += $tmp4 yrhBezierCurves.Global

# y
scoreboard players operation $tmp yrhBezierCurves.Global = $(10-t)³ yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p0_y yrhBezierCurves.Global
scoreboard players operation $tmp2 yrhBezierCurves.Global = $3(1-t)²t yrhBezierCurves.Global
scoreboard players operation $tmp2 yrhBezierCurves.Global *= $p1_y yrhBezierCurves.Global
scoreboard players operation $tmp3 yrhBezierCurves.Global = $3(1-t)t² yrhBezierCurves.Global
scoreboard players operation $tmp3 yrhBezierCurves.Global *= $p2_y yrhBezierCurves.Global
scoreboard players operation $tmp4 yrhBezierCurves.Global = $t³ yrhBezierCurves.Global
scoreboard players operation $tmp4 yrhBezierCurves.Global *= $p3_y yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global = $tmp yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global += $tmp2 yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global += $tmp3 yrhBezierCurves.Global
scoreboard players operation $y yrhBezierCurves.Global += $tmp4 yrhBezierCurves.Global

# z
scoreboard players operation $tmp yrhBezierCurves.Global = $(10-t)³ yrhBezierCurves.Global
scoreboard players operation $tmp yrhBezierCurves.Global *= $p0_z yrhBezierCurves.Global
scoreboard players operation $tmp2 yrhBezierCurves.Global = $3(1-t)²t yrhBezierCurves.Global
scoreboard players operation $tmp2 yrhBezierCurves.Global *= $p1_z yrhBezierCurves.Global
scoreboard players operation $tmp3 yrhBezierCurves.Global = $3(1-t)t² yrhBezierCurves.Global
scoreboard players operation $tmp3 yrhBezierCurves.Global *= $p2_z yrhBezierCurves.Global
scoreboard players operation $tmp4 yrhBezierCurves.Global = $t³ yrhBezierCurves.Global
scoreboard players operation $tmp4 yrhBezierCurves.Global *= $p3_z yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global = $tmp yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global += $tmp2 yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global += $tmp3 yrhBezierCurves.Global
scoreboard players operation $z yrhBezierCurves.Global += $tmp4 yrhBezierCurves.Global

# 1/1000にしてストレージ化
execute store result storage yrh:bezier_curves x double 0.00001 run \
    scoreboard players get $x yrhBezierCurves.Global
execute store result storage yrh:bezier_curves y double 0.00001 run \
    scoreboard players get $y yrhBezierCurves.Global
execute store result storage yrh:bezier_curves z double 0.00001 run \
    scoreboard players get $z yrhBezierCurves.Global

# コマンド実行
function yrh.bezier_curves:sys/run_command with storage yrh:bezier_curves

# スコア消去
scoreboard objectives remove yrhBezierCurves.Global