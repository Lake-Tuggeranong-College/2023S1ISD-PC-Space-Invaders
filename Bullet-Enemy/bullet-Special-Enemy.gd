extends KinematicBody2D



var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.enemyBulletInstanceCount += 5
	set_physics_process(true)


func _physics_process(delta):
	if GlobalVariables.Player == null:
		queue_free() 
	var collidedObject = move_and_collide(Vector2(0, +speed*delta*0.4))
	if (collidedObject):
		#print("Enemy collide: ",collidedObject.collider.name)
		if "Enemy" in collidedObject.collider.name:
			pass
			#collidedObject.get_collider().queue_free() #Don't kill the enemies.
		else:
			queue_free()
			GlobalVariables.enemyBulletInstanceCount -= 1
			print("Enemy Bullets: ", GlobalVariables.enemyBulletInstanceCount)

func _on_Area2D_body_entered(body):
	if body.name == ("player"):
		get_tree().change_scene("res://mainGame/lose.tscn")
