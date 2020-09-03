package org.danilopianini.util

import java.util.List
import java.util.Collections
import org.eclipse.xtend.lib.annotations.Delegate

class UnmodifiableListSet<E> implements ListSet<E> {

	@Delegate val List<E> base

	new(ListSet<E> base) {
		this.base = Collections.unmodifiableList(base);
	}
	
	override toString() {
		base.toString
	}
	
	override hashCode() {
		base.hashCode
	}
	
	override equals(Object o) {
		base.equals(o)
	}
	
}