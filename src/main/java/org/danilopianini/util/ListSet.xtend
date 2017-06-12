package org.danilopianini.util

import java.util.Set
import java.util.List

/**
 * This interface represents an ordered set (or a list without duplicates). It is the reification of the Java intersection type:
 * 
 * List<E> & Set<E>
 * 
 * The default method spliterator() is inherited from List.
 */
interface ListSet<E> extends Set<E>, List<E> {

	override spliterator() {
		List.super.spliterator()
	}

}