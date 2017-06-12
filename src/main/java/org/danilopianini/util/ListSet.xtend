package org.danilopianini.util

import java.util.Set
import java.util.List
import java.io.Serializable

/**
 * This interface represents an ordered set (or a list without duplicates). It is the reification of the Java intersection type:
 * 
 * List<E> & Set<E>
 * 
 * The default method spliterator() is inherited from List.
 */
interface ListSet<E> extends Set<E>, List<E>, Serializable {

	override spliterator() {
		List.super.spliterator()
	}

}