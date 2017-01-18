using UnityEngine;
using System.Collections;

public class Feet : MonoBehaviour {

    public int touching;

    void OnTriggerEnter(Collider collider)
    {
        touching++;
    }

    void OnTriggerExit(Collider collider)
    {
        touching--;
    }
}
