package org.danilopianini.util

import java.util.Collection
import java.util.LinkedList

class LinkedListSet<E> extends ListBackedSet<E> {

	new(Collection<? extends E> collection) {
		super(new LinkedList(collection))
	}

	new() { super(new LinkedList) }
}