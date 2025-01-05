# Objective-C KVO Crash: Object Deallocated While Observed

This repository demonstrates a common bug in Objective-C related to Key-Value Observing (KVO) where an object is deallocated while another object still holds an observation on it. This leads to a crash. The example showcases the problem and provides a solution.

## Bug Description
The bug occurs when an observer still has a reference to the observed object after it has been deallocated.  When the observed object's `dealloc` method is called, the observer may still try to access it, resulting in a crash (EXC_BAD_ACCESS). 

## Solution
The solution involves ensuring that the observer removes its observation before the observed object is deallocated.  This is typically done in the observer's `dealloc` method or when the observation is no longer needed.