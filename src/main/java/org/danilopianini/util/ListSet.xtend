package org.danilopianini.util

import java.util.Set
import java.util.List

/**
 * This interface represents an ordered set (or a list without duplicates)
 */
interface ListSet<E> extends Set<E>, List<E> {

	override spliterator() {
		List.super.spliterator()
	}

}