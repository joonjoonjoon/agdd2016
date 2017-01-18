using UnityEngine;
using System.Collections;

public class Player : MonoBehaviour {
	
	public float speed;									// Horizontal movement speed
	public float jumpStrength;							// Jump power
	public float gravity;                               // Rigidbodies can have their own gravity, but this makes it all a bit more tweakable

    public KeyCode keyLeft;
    public KeyCode keyRight;
    public KeyCode keyUp;

    private Rigidbody rigidBody;
    private Feet feet;
    private float minJumpCooldown;

    private float xAxis;
    private bool yPressed;

    void Start () {
        feet = GetComponentInChildren<Feet>();
        rigidBody = GetComponent<Rigidbody>();
	}
	
	void Update() {
        xAxis = 0;
        if(Input.GetKey(keyLeft))
        {
            xAxis = -1;
        }
        if (Input.GetKey(keyRight))
        {
            xAxis = 1;
        }
        if (Input.GetKeyDown(keyUp) && feet.touching > 0)
        {
            yPressed = true;
        }
    }

    void FixedUpdate()
    {
        if(yPressed && feet.touching > 0)
        {
            rigidBody.AddForce(Vector3.up * jumpStrength * Time.fixedDeltaTime);
            yPressed = false;
        }
        rigidBody.AddForce(Vector3.left * speed * xAxis * Time.fixedDeltaTime);
    }
}
