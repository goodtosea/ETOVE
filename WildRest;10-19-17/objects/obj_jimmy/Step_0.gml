moveLeft = keyboard_check(ord("A"));
moveRight = keyboard_check(ord("D"));
moveUp = keyboard_check(ord("W"));
moveDown = keyboard_check(ord("S"));
jumpKey = keyboard_check(vk_space);
shootKey = keyboard_check_released(vk_backspace);


if (moveLeft) {//move left
	x -= playerSpeed;
	image_xscale = -1;
	if (image_index > 3) image_index = 0;
}

if (moveRight) {//move right
	x += playerSpeed;
	image_xscale = 1;
	if (image_index > 3) image_index = 0;
}

if (moveRight && moveLeft) {//stops confusion
	image_index = 5;
}

if (moveUp) {//ladder up

}

if (moveDown) {//ladder down

}

if (jumpKey) {//jump
	jumping = true;
	if (jumpDown = true) {
		y += 32;
		jumpDown = false;
		jumping = false;
	}
	if (jumpUp = true) {
		y -= 32;
		jumpUp = false;
		jumpDown = true;
	}
	if (jumping = true) {
		jumpUp = true;
	}
}

if ((shootKey || shooting)) {//shoot
	shooting = true;
	if (cooldown <= 0) {
		instance_create_layer(obj_jimmy.x, obj_jimmy.y, "Instances", obj_bullet);
		cooldown = 9;
	}
	if (image_index == 10) shooting = false;
	if (image_index < 7) image_index = 7;
	cooldown--;
}

if (shootKey && (moveRight || moveLeft)) {
	shooting = false;
	shootKey = false;
	moveRight = false;
	moveLeft = false;
	instance_destroy(obj_bullet);
	if (image_index > 3) image_index = 0;	
}

if (!(moveLeft || moveRight || shooting)) image_index = 5;
if (jumping) image_index = 4;